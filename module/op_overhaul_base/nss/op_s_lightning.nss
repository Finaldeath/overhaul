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

    switch (nSpellId)
    {
        case SPELL_CHAIN_LIGHTNING:
            nDamageDice = min(10, nCasterLevel / 2);
            nTargetType = SPELL_TARGET_SELECTIVEHOSTILE;
            nSortMethod = SORT_METHOD_DISTANCE;
            nObjectType = OBJECT_TYPE_CREATURE;
            nMaxTargets = nCasterLevel;

            // Target gets first damage/bolt so if not present, exit!
            if (!GetIsObjectValid(oTarget)) return;

            SignalSpellCastAt();

            oFirstTarget    = oTarget;
            oPreviousTarget = oTarget;

            ApplyBeamToObject(nBeam, oTarget, FALSE, BODY_NODE_HAND);

            if (GetSpellTargetValid(oTarget, oCaster, nTargetType))
            {
                if (!DoResistSpell(oTarget, oCaster))
                {
                    int nDamage = GetDiceRoll(min(20, nCasterLevel), 6);
                    nDamage     = DoDamageSavingThrow(nDamage, oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_ELECTRICITY);

                    if (nDamage > 0)
                    {
                        ApplyVisualEffectToObject(nVis, oTarget);
                        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL), oTarget);
                    }
                }
            }
            break;
        case SPELL_LIGHTNING_BOLT:
            nDamageDice = min(10, nCasterLevel);
            nTargetType = SPELL_TARGET_STANDARDHOSTILE;
            nSortMethod = SORT_METHOD_DISTANCE_TO_CASTER;
            nObjectType = OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE;
            break;
    }

    float fDelay = 0.0;
    int nCount   = 0;
    json jArray  = GetArrayOfTargets(nTargetType, nSortMethod, nObjectType);

    // Chain Lightning: Remove first target if present and then clear up to nMaxTargets
    if (GetIsObjectValid(oFirstTarget))
    {
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray) && nCount < nMaxTargets; nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            if (oTarget == oFirstTarget)
            {
                jArray = JsonArrayDel(jArray, nIndex);
                break;
            }
        }
        // Get first amount
        jArray = JsonArrayGetRange(jArray, 0, nMaxTargets);

        // Shuffle so the VFX looks cooler
        jArray = JsonArrayTransform(jArray, JSON_ARRAY_SHUFFLE);
    }

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
            nDamage = DoDamageSavingThrow(nDamage, oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_ELECTRICITY, fDelay);

            if (nDamage > 0)
            {
                effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL);

                DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
            }
        }
    }
}
