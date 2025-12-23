//:://////////////////////////////////////////////
//:: Warlock Spells
//:: op_s_warlock
//:://////////////////////////////////////////////
/*
    These are technically spell-like abilities but we're coding them in a proper
    spellbook for now, as spells, since this affords us the ability to have
    attacks of opportunity (although it also means the spells can get automatic
    metamagic applied to them, sigh! Not the biggest deal though).

    The warlock spells cover a large amount of content, around 50 unique spells.

    Some fit easily into other scripts (buffs, Darkness etc.) but Eldritch
    Blast plus blasts/essences will always be here.

    Essentially Eldritch Blast is your base ranged touch attack, and layered
    on top can be one of two things; a Blast and a Essence.

    These blasts and essences can be cast as normal separate spells, but only
    Essences can be added on top of blasts and the base Eltritch Blast via.
    a setting for it.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_warlock"

void main()
{
    // Brimstone Blast fire damage comes first.
    if (GetLastRunScriptEffectScriptType() != 0)
    {
        // If saved remove this instance
        if (DoBrimstoneBlast(oTarget))
        {
            RemoveEffectsFromSpell(oTarget, SPELL_BRIMSTONE_BLAST);
        }
        return;
    }

    if (DoSpellHook()) return;

    // VFX
    int nImpact = VFX_NONE, nVis = VFX_IMP_HEAD_ODD, nBeam = VFX_BEAM_ODD;
    int nObjectType = OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE;
    int nMaxTargets = 1000;

    // Can change to selective hostile
    int nTargetType = SPELL_TARGET_STANDARDHOSTILE;
    // Touch type
    int nTouchType = TOUCH_RANGED;

    // First get the blast type, ie AOE, melee, ranged, etc. some VFX are set here
    switch (nSpellId)
    {
        // Validate the base Eldritch Blast and any base blasts here.
        case SPELL_ELDRITCH_BLAST:
        case SPELL_ELDRITCH_SPEAR:
        {
            // Nothing extra, use default Beam
        }
        break;
        case SPELL_ELDRITCH_CHAIN:
        {
            // You can “jump” the chain to one secondary target per five caster
            // levels, so you can strike two additional targets at 10th level,
            // three additional targets at 15th level, and four additional targets at 20th level.
            nTargetType = SPELL_TARGET_SELECTIVEHOSTILE;
            // We target just creatures because we're choosing them specifically
            nObjectType = OBJECT_TYPE_CREATURE;
            // Initial 1, + up to 4 more max
            nMaxTargets = 1 + clamp(nCasterLevel/5, 1, 4);
        }
        break;
        case SPELL_ELDRITCH_GLAIVE:
        {
            // No extra VFX for now, but need to apply a "Glaive" to our hand or something
            nBeam = VFX_NONE;
        }
        break;
        case SPELL_HIDEOUS_BLOW_ON_HIT:
        {
            // Need a valid item
            if (!GetIsObjectValid(oCastItem))
            {
                if (DEBUG_LEVEL >= ERROR) Error("No valid spell cast item for On Hit property Hideous Blow.");
                return;
            }

            // No beam; wouldn't make sense
            nBeam = VFX_NONE;
            // Remove the item property, no more uses of it until cast again.
            // TODO: Much more useful would be to have a toggle where it sets
            // your attacks per round to be 1, applies this item property
            // permanently, and therefore can do the one-per-round on primary
            // weapon.
            RemoveItemPropertiesMatchingSpellId(oCastItem, SPELL_HIDEOUS_BLOW);
        }
        break;
        default:
        {
            // Validate essences in the include
            if (!GetIsWarlockEssence(nSpellId))
            {
                if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
                return;
            }
        }
        break;
    }

    // Damage is standardised 1d6 up to 10d6 max (per 2 caster levels)
    int nDiceNum = clamp(nCasterLevel/2, 1, 10);

    // We then get what essence may apply (on top). Either nSpellId's or an overlay one. We apply the essence on top.
    int nEssenceId = GetAppliedWarlockEssence(nSpellId);

    // Essence may be higher level, set it here
    if (nEssenceId != SPELL_INVALID)
    {
        // Use Innate levels - all Warlock setup does.
        if (GetSpellLevel(nEssenceId) > GetSpellLevel(nSpellId))
        {
            nSpellLevel = GetSpellLevel(nEssenceId);
            // Refresh the save DC. We should move this to a function perhaps.
            nSpellSaveDC = 10 + nSpellLevel + GetAbilityModifier(ABILITY_CHARISMA, oCaster);
        }
    }

    // Used for Eldtrich Glaive
    int nAttacks = GetAttacksPerRound(oCaster);

    // Damage type may be altered by some essences
    int nDamageType = GetWarlockEldritchBlastDamageType(nSpellId);

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    object oLastTarget;
    float fLastDelay = 0.0;

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE, nObjectType);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = 0.0;
        if (GetSpellIsAreaOfEffect(nSpellId))
        {
            fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

            // Hit roll for single target
            int nTouch = DoTouchAttack(oTarget, oCaster, nTouchType);

            // Beam gets applied like lighting bolt one to the next, regardless of misses!
            // May revamp this to apply to a "nearby point" to then jump to the next one on miss...
            // Also this looks a little goofy since we do it from the initial target, so if there
            // are 2 creatures side to side of them, it goes to the middle, then left then right.
            // We can maybe fix this by reordering the targets chosen and being careful to tag
            // the original one. But for now leaving it as is.
            if (nSpellId == SPELL_ELDRITCH_CHAIN)
            {
                if (nIndex >= nMaxTargets)
                {
                    // Max targets reached, but we'll continue to signal spell cast at
                    continue;
                }
                else if (nIndex == 0)
                {
                    ApplyBeamToObject(nBeam, oTarget, FALSE, BODY_NODE_HAND, 1.7, oCaster);
                    oLastTarget = oTarget;
                    fDelay = 0.5;
                    fLastDelay = 0.5;
                }
                else
                {
                    fDelay = fLastDelay + 0.25;
                    fLastDelay = fDelay;
                    DelayCommand(fDelay, ApplyBeamToObject(nBeam, oTarget, FALSE, BODY_NODE_CHEST, 1.7 - fDelay, oLastTarget));
                    oLastTarget = oTarget;
                }
            }

            if (!DoResistSpell(oTarget, oCaster, fDelay))
            {
                // Roll damage
                int nDamage = GetDiceRoll(nDiceNum, 6);

                // Half damage if not a creature
                if (GetObjectType(oTarget) != OBJECT_TYPE_CREATURE) nDamage /= 2;

                // Half damage if SPELL_ELDRITCH_CHAIN and after the first target
                if (nSpellId == SPELL_ELDRITCH_CHAIN && nIndex > 1) nDamage /= 2;

                // Reflex save
                nDamage = DoDamageSavingThrow(nDamage, oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay);

                if (nDamage > 0)
                {
                    DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, nDamage, nDamageType));
                }

                // Apply essence
                if (nEssenceId) ApplyEssenceEffect(nEssenceId, oTarget, fDelay);
            }
        }
        else
        {
            int bResistSpell = FALSE;
            // Hit roll for single target
            int nTouch = DoTouchAttack(oTarget, oCaster, nTouchType);

            // Beam gets applied regardless
            ApplyBeamToObject(nBeam, oTarget, (nTouch == FALSE));

            if (nTouch)
            {

                bResistSpell = DoResistSpell(oTarget, oCaster, fDelay);
                if (!bResistSpell)
                {
                    // Roll damage
                    int nDamage = GetDiceRoll(nDiceNum, 6);

                    if (nTouch == TOUCH_RESULT_CRITICAL_HIT) nDamage *= 2;

                    // Half damage if not a creature
                    if (GetObjectType(oTarget) != OBJECT_TYPE_CREATURE) nDamage /= 2;

                    if (nDamage > 0)
                    {
                        DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, nDamage, nDamageType));
                    }

                    // Apply essence
                    if (nEssenceId) ApplyEssenceEffect(nEssenceId, oTarget, fDelay);
                }
            }
            // Eldritch Glaive
            if (nSpellId == SPELL_ELDRITCH_GLAIVE)
            {
                // Use amount of attacks detected outside the loop
                // Also we need to not have hit a spell resistance, else all attacks stop (like Flame Arrow etc.)
                if (nAttacks > 1 && !bResistSpell)
                {
                    nAttacks--;
                    fDelay += 0.1;
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SetEffectSpellId(EffectAttackDecrease(5), SPELL_INVALID), oCaster, 0.1);

                    // Reset the array!
                    jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
                }
            }
        }
    }
}

