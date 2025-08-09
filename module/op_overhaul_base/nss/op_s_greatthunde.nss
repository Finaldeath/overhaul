//::///////////////////////////////////////////////
//:: Great Thunderclap
//:: op_s_greatthunde
//:://////////////////////////////////////////////
/*
    You create a loud noise equivalent to a peal of thunder and its accompanying
    shock wave. The spell has three effects. First, all creatures in the area
    must make Will saves to avoid being stunned for 1 round. Second, the
    creatures must make Fortitude saves or be deafened for 1 minute. Third,
    they must make Reflex saves or fall prone for 1 round.

    Here as a separate script for now because of the complexity.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eDeaf = GetEffectLink(EFFECT_TYPE_DEAF);
    effect eKnockdown = GetEffectLink(EFFECT_TYPE_KNOCKDOWN);

    ApplyVisualEffectAtLocation(VFX_FNF_MYSTICAL_EXPLOSION, lTarget);
    ApplyVisualEffectAtLocation(VFX_FNF_SCREEN_SHAKE2, lTarget);

    json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_SONIC, fDelay))
        {
            DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_BLIND_DEAF_M, oTarget));
            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eDeaf, oTarget, RoundsToSeconds(10)));
        }
        if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_SONIC, fDelay))
        {
            effect eStun = GetEffectLink(EFFECT_TYPE_STUNNED);
            DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_STUN, oTarget));
            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eStun, oTarget, RoundsToSeconds(1)));
        }
        if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_SONIC, fDelay))
        {
            DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_SONIC, oTarget));
            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eKnockdown, oTarget, RoundsToSeconds(1)));
        }
    }
}

