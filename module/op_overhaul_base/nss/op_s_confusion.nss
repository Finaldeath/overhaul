//:://////////////////////////////////////////////
//:: Confusion Spells
//:: op_s_confusion
//:://////////////////////////////////////////////
/*
    Confusion
    1/round level, AOE.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nTargetType = SPELL_TARGET_STANDARDHOSTILE;
    int nVis = VFX_INVALID, nImpact = VFX_INVALID;
    int bDelayRandom = FALSE;

    switch (nSpellId)
    {
        case SPELL_CONFUSION:
            nImpact = VFX_FNF_LOS_NORMAL_20;
            nVis    = VFX_IMP_CONFUSION_S;
            bDelayRandom = TRUE;
            break;
        default:
            Debug("[Confusion op_s_confusion] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
            break;
    }

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(nTargetType);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = bDelayRandom ? GetRandomDelay() : GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        if (!DoResistSpell(oTarget, oCaster, fDelay))
        {
            if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_CONFUSED))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS, fDelay))
                {
                    if (nVis >= 0) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                    float fDuration = GetDuration(nCasterLevel, ROUNDS, EFFECT_TYPE_CONFUSED);
                    effect eLink = GetEffectLink(EFFECT_TYPE_CONFUSED);
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                }
            }
        }
    }
}
