//::///////////////////////////////////////////////
//:: Penalty Spells
//:: op_s_penalties
//:://////////////////////////////////////////////
/*
    Things that are save-or-apply eLink for fDuration.

    Slow
    EffectSlow(), 1 round/level. Colossal, 1 Creature / Level

    Bane
    Bane fills the caster's enemies with fear and doubt. They suffer a -1
    penalty on their attack rolls and a -1 penalty on saving throws against
    fear. 1 minute/level. Additionally it will dispel Bless.
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

    // If set will remove the given spell Id on the targets affected (after saves etc.)
    int nRemoveSpellId = SPELL_INVALID;

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
        case SPELL_BANE:
            nTargetType      = SPELL_TARGET_SELECTIVEHOSTILE;
            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            nImmunity        = IMMUNITY_TYPE_MIND_SPELLS;
            nImpact          = VFX_FNF_LOS_EVIL_30;
            nVis             = VFX_IMP_HEAD_EVIL;
            eLink            = EffectLinkEffects(EffectAttackDecrease(1),
                               EffectLinkEffects(EffectSavingThrowDecrease(SAVING_THROW_ALL, 1, SAVING_THROW_TYPE_FEAR),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
            fDuration        = GetDuration(nCasterLevel, MINUTES);
            nRemoveSpellId   = SPELL_BLESS;
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
                            if (nRemoveSpellId != SPELL_INVALID) RemoveEffectsFromSpell(oTarget, nRemoveSpellId);
                            DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                        }
                    }
                }
            }
        }
    }
}
