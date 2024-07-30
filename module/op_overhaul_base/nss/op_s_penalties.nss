//::///////////////////////////////////////////////
//:: Penalty Spells
//:: op_s_penalties
//:://////////////////////////////////////////////
/*
    Things that are save-or-apply eLink for fDuration.

    Slow
    EffectSlow(), 1 round/level. Colossal, 1 Creature / Level
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eLink;
    int nImpact = VFX_NONE, nVis = VFX_NONE, nCreatureLimit, nHDLimit, nHDPool = MAX_INT;
    float fDuration;
    int nSavingThrow = SAVING_THROW_NONE, nSavingThrowType = SAVING_THROW_TYPE_NONE;
    int nImmunity = IMMUNITY_TYPE_NONE;

    // Toggles
    int bDelayRandom = FALSE;

    // Delay variables
    float fDelayOverride = 0.0, fRandomMin = 0.4, fRandomMax = 1.1;

    // Can change to selective hostile
    int nTargetType = SPELL_TARGET_STANDARDHOSTILE;

    switch (nSpellId)
    {
        case SPELL_SLOW:
            nTargetType     = SPELL_TARGET_SELECTIVEHOSTILE;
            nSavingThrow    = SAVING_THROW_WILL;
            nImmunity       = IMMUNITY_TYPE_SLOW;
            nCreatureLimit  = nCasterLevel;
            nImpact         = VFX_FNF_LOS_NORMAL_30;
            nVis            = VFX_IMP_SLOW;
            eLink           = EffectLinkEffects(EffectSlow(), EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
            fDuration       = GetDuration(nCasterLevel, ROUNDS);
            break;
        default:
            Debug("[op_s_penalties] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
            break;
    }

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE);
    int nIndex, nAffected = 0;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = 0.0;
        if (fDelayOverride != 0.0)
        {
            fDelay = fDelayOverride;
        }
        else if (GetSpellIsAreaOfEffect(nSpellId))
        {
            fDelay = bDelayRandom ? GetRandomDelay(fRandomMin, fRandomMax) : GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;
        }

        int nHD = GetHitDice(oTarget);

        if ((nHDLimit == 0 || nHD <= nHDLimit) && (nCreatureLimit == 0 || nAffected < nCreatureLimit))
        {
            // Must be enough points in the pool
            if (nHDPool >= nHD)
            {
                nAffected++;
                nHDPool -= nHD;

                if (!DoResistSpell(oTarget, oCaster, fDelay))
                {
                    if (!GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity))
                    {
                        if (!DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType, fDelay))
                        {
                            DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                        }
                    }
                }
            }
        }
    }
}
