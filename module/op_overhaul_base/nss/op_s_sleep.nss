//::///////////////////////////////////////////////
//:: Sleep
//:: op_s_sleep
//:://////////////////////////////////////////////
/*
    Sleep spells.

    Sleep
    1d4 + 4 HD worth, max 4HD. 5 + caster level rounds duration.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eLink = EffectLinkEffects(EffectSleep(),
                   EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE),
                                     EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
    int nImpact = VFX_NONE, nVis = VFX_NONE, nHDLimit, nHDPool;
    int nDuration;

    switch (nSpellId)
    {
        case SPELL_SLEEP:
            nImpact = VFX_FNF_LOS_NORMAL_20;
            nVis = VFX_IMP_SLEEP;
            nHDLimit = 4;
            nHDPool = GetDiceRoll(1, 4, 4);
            nDuration = nCasterLevel + 5;
        break;
        default:
            OP_Debug("[Sleep op_s_sleep] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        break;
    }

    // AOE?
    if (GetSpellIsAreaOfEffect(nSpellId))
    {
        ApplyVisualEffectAtLocation(nImpact, lTarget);

        json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_LOWEST_HD);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt();

            int nHD = GetHitDice(oTarget);

            // We always signal event to anyone in the AOE, but these cases
            // stop the spell applying entirely (and don't affect the HD pool)
            // While immunity doesn't stop the pool being used up.
            if (GetRacialType(oTarget) != RACIAL_TYPE_UNDEAD &&
                GetRacialType(oTarget) != RACIAL_TYPE_CONSTRUCT &&
                nHD <= nHDLimit &&
               !GetHasEffect(oTarget, EFFECT_TYPE_SLEEP))
            {
                // Must be enough points in the pool
                if (nHDPool >= nHD)
                {
                    nHDPool -= nHD;

                    float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget)/20.0;

                    if (!DoResistSpell(oTarget, oCaster, fDelay))
                    {
                        if (!GetIsImmuneWithFeedback(oTarget, IMMUNITY_TYPE_SLEEP, oCaster))
                        {
                            if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS, fDelay))
                            {
                                DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                                float fDuration = GetScaledDuration(oTarget, nDuration, ROUNDS);
                                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                            }
                        }
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

