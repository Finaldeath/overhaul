//::///////////////////////////////////////////////
//:: Howl Abilities
//:: op_a_howl
//:://////////////////////////////////////////////
/*
    Howls of various kinds.

    Captivating Song
    Charm in AOE, DC Shifter Level/3 + 15, or just DC 15.

    Howl; Confusion, Daze, Death, Doom, Fear, Parlaysis, Sonic, Stunning
    Saving throw DC: 10 + (nHD/4)
    Duration if applicable: 1 + (nHD/4) rounds
    Damage if applicable: d6(nHD/4)

    Main Overhaul update is that they must be able to hear the user (not deaf
    etc.) to be affected.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Damage?
    int nDamageType = -1;

    // Saving throw and immunity?
    int nSavingThrow = SAVING_THROW_NONE, nSavingThrowType = SAVING_THROW_TYPE_NONE;
    int nImmunity = IMMUNITY_TYPE_NONE;
    int bImmuneIfCannotHear = TRUE;

    // VFX
    int nImpact = VFX_NONE, nVis = VFX_NONE;
    int nTargetType = SPELL_TARGET_SELECTIVEHOSTILE;

    // If set we generate it per-target in the loop due to GetScaledEffect
    int nEffectType = EFFECT_TYPE_INVALIDEFFECT;

    // Duration, DC and damage dealt with here (replaced for Capitvating Song)
    int nHD = GetHitDice(oCaster);
    nSpellSaveDC = 10 + (nHD / 4);
    int nDuration = 1 + (nHD/4);
    // Damage
    int nDiceNum = max(1, nHD / 4);
    int nDiceSize = 6;

    switch (nSpellId)
    {
        case SPELLABILITY_CAPITVATING_SONG:
        {
            if (GetIsPolymorphed(oCaster))
            {
                int nShifter = GetLevelByClass(CLASS_TYPE_SHIFTER,OBJECT_SELF) / 3;
                if (nShifter < 1)
                {
                    nShifter = 0;
                }
                nSpellSaveDC = 15 + nShifter;
            }
            else
            {
                nSpellSaveDC = 15;
            }

            nEffectType      = EFFECT_TYPE_CHARMED;
            nImmunity        = IMMUNITY_TYPE_CHARM;
            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            nImpact     = VFX_FNF_LOS_NORMAL_30;
            nVis        = VFX_IMP_CHARM;
            nDuration   = 6;
        }
        break;
        case SPELLABILITY_HOWL_CONFUSE:
        {
            nEffectType      = EFFECT_TYPE_CONFUSED;
            nImmunity        = IMMUNITY_TYPE_CONFUSED;
            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            nImpact          = VFX_FNF_HOWL_MIND;
            nVis             = VFX_IMP_CONFUSION_S;
        }
        break;
        case SPELLABILITY_HOWL_DAZE:
        {
            nEffectType      = EFFECT_TYPE_DAZED;
            nImmunity        = IMMUNITY_TYPE_DAZED;
            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            nImpact          = VFX_FNF_HOWL_MIND;
            nVis             = VFX_IMP_DAZED_S;
        }
        break;
        case SPELLABILITY_HOWL_DEATH:
        {
            nEffectType      = EFFECT_TYPE_DEATH;
            nImmunity        = IMMUNITY_TYPE_DEATH; // Not a true death spell?
            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_DEATH;
            nImpact          = VFX_FNF_HOWL_ODD;
            nVis             = VFX_IMP_DEATH;
        }
        break;
        case SPELLABILITY_HOWL_DOOM:
        {
            nEffectType      = LINK_EFFECT_DOOM;
            nSavingThrow     = SAVING_THROW_WILL;
            nImpact          = VFX_FNF_HOWL_ODD;
            nVis             = VFX_IMP_DOOM;
        }
        break;
        case SPELLABILITY_HOWL_FEAR:
        {
            nEffectType      = EFFECT_TYPE_FRIGHTENED;
            nImmunity        = IMMUNITY_TYPE_FEAR;
            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_FEAR;
            nImpact          = VFX_FNF_HOWL_MIND;
            nVis             = VFX_IMP_FEAR_S;
        }
        break;
        case SPELLABILITY_HOWL_PARALYSIS:
        {
            nEffectType      = EFFECT_TYPE_PARALYZE;
            nImmunity        = IMMUNITY_TYPE_PARALYSIS;
            nSavingThrow     = SAVING_THROW_WILL;
            nImpact          = VFX_FNF_HOWL_ODD;
        }
        break;
        case SPELLABILITY_HOWL_SONIC:
        {
            nDamageType      = DAMAGE_TYPE_SONIC;
            nSavingThrow     = SAVING_THROW_FORT;
            nSavingThrowType = SAVING_THROW_TYPE_SONIC;
            nImpact          = VFX_FNF_HOWL_WAR_CRY;
            nVis             = VFX_IMP_SONIC;
        }
        break;
        case SPELLABILITY_HOWL_STUN:
        {
            nEffectType      = EFFECT_TYPE_STUNNED;
            nImmunity        = IMMUNITY_TYPE_STUN;
            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            nImpact          = VFX_FNF_HOWL_MIND;
            nVis             = VFX_IMP_STUN;
        }
        break;


        default:
            Debug("[op_s_aoeeffect] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
            break;
    }

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        if (!GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity) &&
            (!bImmuneIfCannotHear || GetCanHear(oTarget)))
        {
            // Saving throw or strength check?
            int bSaved = FALSE;
            if (nSavingThrow != -1)
            {
                bSaved = DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType, fDelay);
            }

            // Damage?
            if (nDamageType != -1)
            {
                int nDamage = GetDiceRoll(nDiceNum, nDiceSize);

                if (nSavingThrow != -1)
                {
                    nDamage = GetDamageBasedOnFeats(nDamage, oTarget, nSavingThrow, bSaved);
                }

                if (nDamage > 0)
                {
                    DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage, nDamageType));
                }
            }

            if (!bSaved)
            {
                if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));

                effect eLink;
                float fDuration = 0.0;
                // Create effects and duration now
                if (nEffectType == EFFECT_TYPE_FRIGHTENED ||
                    nEffectType == EFFECT_TYPE_STUNNED ||
                    nEffectType == EFFECT_TYPE_PARALYZE ||
                    nEffectType == EFFECT_TYPE_CHARMED ||
                    nEffectType == EFFECT_TYPE_CONFUSED)
                {
                    eLink = GetEffectLink(nEffectType, oTarget);
                    fDuration = GetScaledDuration(oTarget, nDuration, ROUNDS);
                }
                else if (nEffectType == EFFECT_TYPE_DEATH)
                {
                    eLink = IgnoreEffectImmunity(EffectDeath());
                }
                else if (nEffectType == EFFECT_TYPE_DAZED ||
                         nEffectType == LINK_EFFECT_DOOM)
                {
                    eLink = GetEffectLink(nEffectType, oTarget);
                    fDuration = GetDuration(nDuration, ROUNDS);
                }

                if (fDuration == 0.0)
                {
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eLink, oTarget));
                }
                else
                {
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                }
            }
        }
    }
}

