//::///////////////////////////////////////////////
//:: Lightning spells
//:: op_s_lightning
//:://////////////////////////////////////////////
/*
    For VFX beam purposes.

    Lightning Bolt
    Indiscriminate bolt of lightning up to 10d6 damage.

    Chain Lightning
    Up to 20d6 to primary target then up to 10d6 for each secondary. Selective
    hostile.

    Gedlee's Electric Loop
    1d6/2 caster levels, 5d6 max damage. If failed reflex save, Will save or
    stunned for 1 round. Decided to make selective hostile.
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
    int nDamageDice, nTargetType, nSortMethod, nObjectType, nMaxTargets = 10000;
    int nVis  = VFX_IMP_LIGHTNING_S;
    int nBeam = VFX_BEAM_LIGHTNING;

    // Extra stun for Loop
    int bExtraStun = FALSE;

    switch (nSpellId)
    {
        case SPELL_CHAIN_LIGHTNING:
            nDamageDice = min(10, nCasterLevel / 2);
            nTargetType = SPELL_TARGET_SELECTIVEHOSTILE;
            nSortMethod = SORT_METHOD_RANDOM;
            nObjectType = OBJECT_TYPE_CREATURE;
            nMaxTargets = nCasterLevel;
            break;
        case SPELL_LIGHTNING_BOLT:
            nDamageDice = min(10, nCasterLevel);
            nTargetType = SPELL_TARGET_STANDARDHOSTILE;
            nSortMethod = SORT_METHOD_DISTANCE_TO_CASTER;
            nObjectType = OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE;
            break;
        case SPELL_GEDLEES_ELECTRIC_LOOP:
            nDamageDice = clamp(nCasterLevel/2, 1, 5);
            nTargetType = SPELL_TARGET_SELECTIVEHOSTILE;
            nSortMethod = SORT_METHOD_RANDOM;
            nObjectType = OBJECT_TYPE_CREATURE;
            bExtraStun  = TRUE;
            break;
        default:
            Debug("[op_s_lightning] No valid spell ID passed in: " + IntToString(nSpellId));
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

        fDelay += 0.1;

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
        nBeam = (nBeam == VFX_BEAM_LIGHTNING) ? VFX_BEAM_SILENT_LIGHTNING : VFX_BEAM_LIGHTNING;

        if (!DoResistSpell(oTarget, oCaster, fDelay))
        {
            // Roll damage
            int nDamage = GetDiceRoll(nDamageDice, 6);

            // Damage modification based on save (half, with Reflex allowing feats to reduce further)
            int bReflexSave = DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_ELECTRICITY, fDelay);

            nDamage = GetDamageBasedOnFeats(nDamage, oTarget, SAVING_THROW_REFLEX, bReflexSave);

            if (nDamage > 0)
            {
                effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL);

                DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
            }
            if (bExtraStun && bReflexSave == FALSE)
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_ELECTRICITY, fDelay))
                {
                    effect eStun = EffectLinkEffects(EffectStunned(), EffectVisualEffect(VFX_IMP_STUN));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eStun, oTarget, 6.0));
                }
            }
        }
    }
}
