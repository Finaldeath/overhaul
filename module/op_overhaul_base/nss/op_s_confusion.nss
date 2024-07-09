//::///////////////////////////////////////////////
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

    effect eLink = EffectLinkEffects(EffectConfused(),
                   EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED),
                                     EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
    effect eImpact;
    int nVis = VFX_INVALID, nImpact = VFX_INVALID;

    switch (nSpellId)
    {
        case SPELL_CONFUSION:
            nImpact = VFX_FNF_LOS_NORMAL_20;
            nVis = VFX_IMP_CONFUSION_S;
        break;
        default:
            OP_Debug("[Confusion op_s_confusion] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        break;
    }

    // AOE?
    if (GetSpellIsAreaOfEffect(nSpellId))
    {
        ApplyVisualEffectAtLocation(nImpact, lTarget);

        json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt();

            float fDelay = GetRandomDelay();

            if (!DoResistSpell(oTarget, oCaster, fDelay))
            {
                if (!GetIsImmuneWithFeedback(oTarget, EFFECT_TYPE_CONFUSED, oCaster))
                {
                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS, fDelay))
                    {
                        if (nVis >= 0) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                        float fDuration = GetScaledDuration(oTarget, nCasterLevel, ROUNDS);
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                    }
                }
            }
        }
    }
    else
    {
        // None yet
    }
}

