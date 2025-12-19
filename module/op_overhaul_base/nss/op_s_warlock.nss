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
    if (DoSpellHook()) return;

    // VFX
    int nImpact = VFX_NONE, nVis = VFX_IMP_HEAD_ODD, nBeam = VFX_NONE;

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
            nBeam = VFX_BEAM_ODD;
        }
        break;
        case SPELL_ELDRITCH_GLAIVE:
        {
            // No extra VFX for now, but need to apply a "Glaive" to our hand or something
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

    // We alter the spell Id now to always be "Eldritch Blast" for simplicity since
    // this covers us having multiple negative effects stacking for cases of
    // ability/skill changes.
    nSpellId = SPELL_ELDRITCH_BLAST;

    // Used for Eldtrich Glaive
    int nAttacks = GetAttacksPerRound(oCaster);

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = 0.0;
        if (GetSpellIsAreaOfEffect(nSpellId))
        {
            fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

            if (!DoResistSpell(oTarget, oCaster, fDelay))
            {
                // Roll damage
                int nDamage = GetDiceRoll(nDiceNum, 6);

                // Half damage if not a creature
                if (GetObjectType(oTarget) != OBJECT_TYPE_CREATURE) nDamage /= 2;

                // Reflex save
                nDamage = DoDamageSavingThrow(nDamage, oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay);

                if (nDamage > 0)
                {
                    DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, nDamage, DAMAGE_TYPE_MAGICAL));
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
            if (nTouch)
            {
                // Beam gets applied regardless
                ApplyBeamToObject(nBeam, oTarget, (nTouch == FALSE));

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
                        DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, nDamage, DAMAGE_TYPE_MAGICAL));
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

