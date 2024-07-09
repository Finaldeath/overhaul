//::///////////////////////////////////////////////
//:: Command the Horde
//:: op_f_commandhord.nss
//:://////////////////////////////////////////////
/*
    Specifics: At 1st level, the Eye of Gruumsh may grant a +2 morale bonus
    on Will saving throws to any allies within 30 feet. The effect lasts
    for 1 hour per eye of Gruumsh level.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    lTarget = GetLocation(oCaster);
    if (GetGender(oCaster) == GENDER_FEMALE)
    {
        ApplyVisualEffectAtLocation(VFX_FNF_HOWL_WAR_CRY_FEMALE, lTarget);
    }
    else
    {
        ApplyVisualEffectAtLocation(VFX_FNF_HOWL_WAR_CRY, lTarget);
    }

    effect eLink = EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_WILL, 2),
                                     EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink        = ExtraordinaryEffect(eLink);

    nCasterLevel = GetLevelByClass(CLASS_TYPE_EYE_OF_GRUUMSH, oCaster);

    if (nCasterLevel == 0)
    {
        if (DEBUG_LEVEL >= LOG_LEVEL_ERROR) OP_Debug("[ERROR] Command the Horde no class levels in Eye of Gruumsh. Script called in error?");
        return;
    }

    float fDuration = GetDuration(nCasterLevel, HOURS);

    json jArray = GetArrayOfTargets(SPELL_TARGET_ALLALLIES);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget))/25.0;

        DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_IMPROVE_ABILITY_SCORE, oTarget));
        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
    }
}
