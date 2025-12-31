//:://////////////////////////////////////////////
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

    Blindness/Deafness
    Apply both to targert 1 round/level fotitude negates.

    Mass Blindness/Deafness
    AOE as per blindness/deafness.

    Doom
    The target creature receives a -2 modifier to all attack rolls, damage
    rolls, saving throws, ability checks and skill checks.
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
    int nImmunity1 = IMMUNITY_TYPE_NONE, nImmunity2 = IMMUNITY_TYPE_NONE;

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
        {
            nTargetType     = SPELL_TARGET_SELECTIVEHOSTILE;
            nSavingThrow    = SAVING_THROW_WILL;
            nImmunity1       = IMMUNITY_TYPE_SLOW;
            nCreatureLimit  = nCasterLevel;
            nImpact         = VFX_FNF_LOS_NORMAL_30;
            nVis            = VFX_IMP_SLOW;
            eLink           = GetEffectLink(EFFECT_TYPE_SLOW);
            fDuration       = GetDuration(nCasterLevel, ROUNDS);
        }
        break;
        case SPELL_BANE:
        {
            nTargetType      = SPELL_TARGET_SELECTIVEHOSTILE;
            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            nImmunity1        = IMMUNITY_TYPE_MIND_SPELLS;
            nImpact          = VFX_FNF_LOS_EVIL_30;
            nVis             = VFX_IMP_HEAD_EVIL;
            eLink            = EffectLinkEffects(EffectAttackDecrease(1),
                               EffectLinkEffects(EffectSavingThrowDecrease(SAVING_THROW_ALL, 1, SAVING_THROW_TYPE_FEAR),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
            fDuration        = GetDuration(nCasterLevel, MINUTES);
            nRemoveSpellId   = SPELL_BLESS;
        }
        break;
        case SPELL_BLINDNESS_AND_DEAFNESS:
        {
            nSavingThrow     = SAVING_THROW_FORT;
            nImmunity1       = IMMUNITY_TYPE_BLINDNESS;
            nImmunity2       = IMMUNITY_TYPE_DEAFNESS;
            nVis             = VFX_IMP_BLIND_DEAF_M;
            eLink            = EffectLinkEffects(EffectBlindness(),
                               EffectLinkEffects(EffectDeaf(),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
            fDuration        = GetDuration(nCasterLevel, ROUNDS);
        }
        break;
        case SPELL_MASS_BLINDNESS_AND_DEAFNESS:
        {
            nTargetType      = SPELL_TARGET_SELECTIVEHOSTILE;
            nSavingThrow     = SAVING_THROW_FORT;
            nImmunity1       = IMMUNITY_TYPE_BLINDNESS;
            nImmunity2       = IMMUNITY_TYPE_DEAFNESS;
            nImpact          = VFX_FNF_BLINDDEAF;
            nVis             = VFX_IMP_BLIND_DEAF_M;
            eLink            = EffectLinkEffects(EffectBlindness(),
                               EffectLinkEffects(EffectDeaf(),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
            fDuration        = GetDuration(nCasterLevel, ROUNDS);
        }
        break;
        case SPELL_DOOM:
        {
            nSavingThrow     = SAVING_THROW_FORT;
            nVis             = VFX_IMP_DOOM;
            eLink            = GetEffectLink(LINK_EFFECT_DOOM);
            fDuration        = GetDuration(nCasterLevel, ROUNDS);
        }
        break;
        case SPELL_DREAD_SEIZURE:
        {
            nSavingThrow    = SAVING_THROW_FORT;
            nVis            = VFX_IMP_SLOW; // TODO new VFX
            eLink           = EffectLinkEffects(EffectMovementSpeedDecrease(30),
                              EffectLinkEffects(EffectAttackDecrease(3),
                                                EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
            fDuration       = GetDuration(3, ROUNDS);
            nRemoveSpellId  = SPELL_DREAD_SEIZURE;
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
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
                    if (!GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity1) && !GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity2))
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
