//::///////////////////////////////////////////////
//:: Dismissal
//:: op_s_dismissal.nss
//:://////////////////////////////////////////////
/*
    All summoned creatures, animal companions, and familiars are unsummoned
    within the area of effect. The saving throw is modified by adding your
    caster level, and taking off the targets hit dice.

    NB: We're not removing outsiders. This otherwise is kinda more powerful
    (sometimes) then Banishment.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Effects
    effect eDeath  = IgnoreEffectImmunity(EffectDeath());
    effect eVis    = EffectVisualEffect(VFX_IMP_UNSUMMON);
    effect eImpact = EffectVisualEffect(VFX_IMP_UNSUMMON, FALSE, 5.0);

    ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, lTarget);

    json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_NONE, SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, TRUE);

    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        // We signal this event against everyone even if it should stop early.
        SignalSpellCastAt();

        if (GetAssociateType(oTarget) == ASSOCIATE_TYPE_SUMMONED ||
            GetAssociateType(oTarget) == ASSOCIATE_TYPE_FAMILIAR ||
            GetAssociateType(oTarget) == ASSOCIATE_TYPE_ANIMALCOMPANION)
        {
            float fDelay = GetRandomDelay(0.2, 0.3);

            int nNewSaveDC = max(1, nSpellSaveDC + nCasterLevel - GetHitDice(oTarget));

            if (!DoResistSpell(oTarget, oCaster, fDelay) &&
                !DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nNewSaveDC, SAVING_THROW_TYPE_NONE, fDelay))
            {
                // Set them to be destroyable so they fade (but leave a loot bag in case of plot)
                SetIsDestroyable(TRUE, FALSE, FALSE, oTarget);

                // This deals with Immortal and Plot flag fine.
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget));
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
            }
        }
    }
}

