//:://////////////////////////////////////////////
//:: Sun Spells
//:: op_s_sun
//:://////////////////////////////////////////////
/*
    Split from op_s_lightning due to different effects.

    Sunbeam

    The caster summons a beam of divine radiance to blind and burn those within
    the area of effect. Undead and Oozes take 1d6 points of divine damage per
    caster level, to a maximum of 20d6. All other creatures take 3d6 points of
    divine damage, and are blinded for 3 rounds. A successful reflex save
    reduces damage by half and negates the blindness.

    Sunburst

    A brilliant explosion occurs where the caster directs affecting all
    creatures caught in its area, causing 1d6 points of damage per caster level
    (to a maximum of 25d6) to all undead and oozes. Other creatures suffer only
    6d6 damage. Vampires are destroyed instantly if they fail a Reflex saving
    throw. All enemies in the area of effect must also make a successful Reflex
    saving throw or be blinded permanently (the blindness can only be magically
    removed).
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    object oFirstTarget = OBJECT_INVALID, oPreviousTarget;
    int nDamageDice, nSecondDice, nTargetType, nSortMethod, nObjectType, nMaxTargets = 10000;
    int bBlindPermanent = FALSE;
    int nVis  = VFX_IMP_SUNSTRIKE;
    int nGroundVis = VFX_NONE;
    int nBeam = VFX_BEAM_HOLY;
    int nImpact = VFX_NONE;

    effect eBlind = EffectLinkEffects(EffectBlindness(), EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));

    switch (nSpellId)
    {
        case SPELL_SUNBEAM:
        {
            nDamageDice = min(20, nCasterLevel);
            nSecondDice = 3;
            nTargetType = SPELL_TARGET_STANDARDHOSTILE;
            nSortMethod = SORT_METHOD_DISTANCE_TO_CASTER;
            nObjectType = OBJECT_TYPE_CREATURE;
        }
        break;
        case SPELL_SUNBURST:
        {
            nBeam = VFX_NONE;
            nGroundVis = VFX_IMP_DIVINE_STRIKE_FIRE; // Could use a new VFX tbh.
            nImpact = VFX_FNF_LOS_HOLY_30;
            bBlindPermanent = TRUE;
            nDamageDice = min(25, nCasterLevel);
            nSecondDice = 6;
            nTargetType = SPELL_TARGET_STANDARDHOSTILE;
            nSortMethod = SORT_METHOD_DISTANCE;
            nObjectType = OBJECT_TYPE_CREATURE;
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    float fDelay = 0.0;
    int nCount   = 0;
    json jArray  = GetArrayOfTargets(nTargetType, nSortMethod, nObjectType);

    // If it's targeted against a specific person and the sort method is random, we will put them at the front
    if (nSortMethod == SORT_METHOD_RANDOM && GetIsObjectValid(oTarget))
    {
        // Find existing target
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            object oArrayTarget = GetArrayObject(jArray, nIndex);

            if (oArrayTarget == oTarget)
            {
                jArray = JsonArrayDel(jArray, nIndex);
                break;
            }
        }
        // Add to start
        json jObject = JsonObject();
        jObject = JsonObjectSet(jObject, FIELD_OBJECTID, JsonString(ObjectToString(oTarget)));
        jArray = JsonArrayInsert(jArray, jObject, 0);
    }

    // Limit to nMaxTargets
    jArray = JsonArrayGetRange(jArray, 0, nMaxTargets - 1);

    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        fDelay += 0.01; // 0.1 for Lighting Bolt but less for Sunbeam

        if (nBeam != VFX_NONE)
        {
            if (GetIsObjectValid(oPreviousTarget))
            {
                DelayCommand(fDelay, ApplyBeamToObject(nBeam, oTarget, FALSE, BODY_NODE_CHEST, 1.0, oPreviousTarget));
            }
            else
            {
                ApplyBeamToObject(nBeam, oTarget);
            }
            oPreviousTarget = oTarget;

            // Alternate loud and silent lightning to not overload in large lightning amounts
            // TODO have divine beam with silent version
            //nBeam = (nBeam == VFX_BEAM_LIGHTNING) ? VFX_BEAM_SILENT_LIGHTNING : VFX_BEAM_LIGHTNING;
        }

        if (!DoResistSpell(oTarget, oCaster, fDelay))
        {
            // Damage modification based on save (half, with Reflex allowing feats to reduce further)
            int bReflexSave = DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_DIVINE, fDelay);

            // Decide what kind of effect to apply (ooze or undead)
            if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD ||
                GetRacialType(oTarget) == RACIAL_TYPE_OOZE)
            {
                // Vampire = death, else take half damage / reflex adjusted damage
                if (GetIsVampire(oTarget) && !bReflexSave)
                {
                    DelayCommand(fDelay, ApplyDeathDamageToObject(oTarget, nVis, DAMAGE_TYPE_DIVINE));
                    continue;
                }

                // Roll up to 20d6 divine damage
                int nDamage = GetDiceRoll(nDamageDice, 6);

                nDamage = GetDamageBasedOnFeats(nDamage, oTarget, SAVING_THROW_REFLEX, bReflexSave);

                if (nDamage > 0)
                {
                    if (nGroundVis != VFX_NONE) DelayCommand(fDelay, ApplyVisualEffectAtObjectsLocation(nGroundVis, oTarget));
                    DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, nVis, nDamage, DAMAGE_TYPE_DIVINE));
                }
            }
            else if (nSecondDice > 0)
            {
                // Roll up to 3d6 divine damage
                int nDamage = GetDiceRoll(nSecondDice, 6);

                nDamage = GetDamageBasedOnFeats(nDamage, oTarget, SAVING_THROW_REFLEX, bReflexSave);

                if (nDamage > 0)
                {
                    if (nGroundVis != VFX_NONE) DelayCommand(fDelay, ApplyVisualEffectAtObjectsLocation(nGroundVis, oTarget));
                    DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, nVis, nDamage, DAMAGE_TYPE_DIVINE));
                }
            }
            // Blindness if we failed the save
            if (!bReflexSave)
            {
                if (bBlindPermanent)
                {
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_PERMANENT, eBlind, oTarget));
                }
                else
                {
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eBlind, oTarget, RoundsToSeconds(3)));
                }
            }
        }
    }
}
