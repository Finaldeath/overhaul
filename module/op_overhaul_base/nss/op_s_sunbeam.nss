//::///////////////////////////////////////////////
//:: Sunbeam
//:: op_s_sunbeam
//:://////////////////////////////////////////////
/*
    For VFX beam purposes.

    May move to op_s_lightning and rename it sometime but this is specifically
    mostly copied from it.

    The caster summons a beam of divine radiance to blind and burn those within
    the area of effect. Undead and Oozes take 1d6 points of divine damage per
    caster level, to a maximum of 20d6. All other creatures take 3d6 points of
    divine damage, and are blinded for 3 rounds. A successful reflex save
    reduces damage by half and negates the blindness.
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
    int nVis  = VFX_IMP_SUNSTRIKE;
    int nBeam = VFX_BEAM_HOLY;

    effect eBlind = EffectLinkEffects(EffectBlindness(), EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));

    switch (nSpellId)
    {
        case SPELL_SUNBEAM:
            nDamageDice = min(20, nCasterLevel);
            nSecondDice = 3;
            nTargetType = SPELL_TARGET_STANDARDHOSTILE;
            nSortMethod = SORT_METHOD_DISTANCE_TO_CASTER;
            nObjectType = OBJECT_TYPE_CREATURE;
            break;
        default:
            Debug("[op_s_sunbeam] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
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

        if (!DoResistSpell(oTarget, oCaster, fDelay))
        {
            // Damage modification based on save (half, with Reflex allowing feats to reduce further)
            int bReflexSave = DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_DIVINE, fDelay);

            // Decide what kind of effect to apply (ooze or undead)
            if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD ||
                GetRacialType(oTarget) == RACIAL_TYPE_OOZE)
            {
                // Roll up to 20d6 divine damage
                int nDamage = GetDiceRoll(nDamageDice, 6);

                nDamage = GetDamageBasedOnFeats(nDamage, oTarget, SAVING_THROW_REFLEX, bReflexSave);

                if (nDamage > 0)
                {
                    effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_DIVINE);

                    DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
                }
            }
            else if (nSecondDice > 0)
            {
                // Roll up to 3d6 divine damage
                int nDamage = GetDiceRoll(nSecondDice, 6);

                // Blindness if we failed the save
                if (!bReflexSave)
                {
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eBlind, oTarget, RoundsToSeconds(3)));
                }

                nDamage = GetDamageBasedOnFeats(nDamage, oTarget, SAVING_THROW_REFLEX, bReflexSave);

                if (nDamage > 0)
                {
                    effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_DIVINE);

                    DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
                }
            }
        }
    }
}
