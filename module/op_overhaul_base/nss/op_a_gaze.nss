//::///////////////////////////////////////////////
//:: Gaze Abilities
//:: op_a_gaze.nss
//:://////////////////////////////////////////////
/*
    Main thing here is they must be able to be able to see (not blinded) to
    be affected by a gaze. Assume LOS means they can otherwise "see" us.

    Gaze: Charm, Confusion, Daze, Death, Destroy Chaos, Destroy Evil, Destroy
    Good, Destroy Law, Dominate, Doom, Fear, Paralysis, Stunned
    Krenshar, Fear Gaze

    Difficulty Class, where applicable: 10 + 1 for every 2 HD.
    Damage: None.
    Duration, where applicable: 1 round + 1 for every 3 HD.

    Mind-Affecting: Charm, Confusion, Daze, Dominate, Fear, Stun.
    Negative Energy: Doom, Death, Destroy Law, Destroy Good.
    Positive Energy: Destroy Evil, Destroy Chaos.
    Movement Impeding: Paralysis.
    Miscellaneous: Krenshar Fear Gaze (DC 12, 3 round duration).
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    // Can't use Gazes if can't see
    if (!GetCanSee(oCaster))
    {
        FloatingTextStrRefOnCreature(STRREF_GAZE_ATTACK_FAILED_BLINDED, oCaster, FALSE); // * Gaze attack failed - blinded! *
        return;
    }

    if (DoSpellHook()) return;

    int nSavingThrow = SAVING_THROW_NONE;
    int nSavingThrowType = SAVING_THROW_TYPE_NONE;

    int nTargetType = SPELL_TARGET_STANDARDHOSTILE;

    int nVis = VFX_INVALID;
    int nImmunity = -1;
    int nEffectType;

    // Need to match this alignment to be affected, else -1
    int nGoodEvilAlignmentRequired = -1;
    int nLawChaosAlignmentRequired = -1;

    int nHD = GetHitDice(oCaster);

    // Duration in rounds, changed based on target
    int nDuration = 1 + (nHD/3);
    nSpellSaveDC = 10 + (nHD/2);

    switch (nSpellId)
    {
        case SPELLABILITY_KRENSHAR_SCARE:
        {
            // From original Bioware script; doesn't scale
            nDuration = 3;
            nSpellSaveDC = 12;
            nSavingThrow = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_FEAR;
            nImmunity = IMMUNITY_TYPE_FEAR;
            nEffectType = EFFECT_TYPE_FRIGHTENED;
            nVis = VFX_IMP_FEAR_S;
        }
        break;
        case SPELLABILITY_GAZE_CHARM:
        {
            nSavingThrow = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            nImmunity = IMMUNITY_TYPE_CHARM;
            nEffectType = EFFECT_TYPE_CHARMED;
            nVis = VFX_IMP_CHARM;
        }
        break;
        case SPELLABILITY_GAZE_CONFUSION:
        {
            nSavingThrow = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            nImmunity = IMMUNITY_TYPE_CONFUSED;
            nEffectType = EFFECT_TYPE_CONFUSED;
            nVis = VFX_IMP_CONFUSION_S;
        }
        break;
        case SPELLABILITY_GAZE_DAZE:
        {
            nSavingThrow = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            nImmunity = IMMUNITY_TYPE_DAZED;
            nEffectType = EFFECT_TYPE_DAZED;
            nVis = VFX_IMP_DAZED_S;
        }
        break;
        case SPELLABILITY_GAZE_DEATH:
        case SPELLABILITY_GAZE_DESTROY_CHAOS:
        case SPELLABILITY_GAZE_DESTROY_EVIL:
        case SPELLABILITY_GAZE_DESTROY_GOOD:
        case SPELLABILITY_GAZE_DESTROY_LAW:
        {
            if (nSpellId == SPELLABILITY_GAZE_DESTROY_CHAOS) nLawChaosAlignmentRequired == ALIGNMENT_CHAOTIC;
            else if (nSpellId == SPELLABILITY_GAZE_DESTROY_EVIL) nGoodEvilAlignmentRequired == ALIGNMENT_EVIL;
            else if (nSpellId == SPELLABILITY_GAZE_DESTROY_GOOD) nGoodEvilAlignmentRequired == ALIGNMENT_GOOD;
            else if (nSpellId == SPELLABILITY_GAZE_DESTROY_LAW) nLawChaosAlignmentRequired == ALIGNMENT_LAWFUL;

            nSavingThrow = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_DEATH;
            nImmunity = IMMUNITY_TYPE_DEATH;
            nEffectType = EFFECT_TYPE_DEATH;
            nVis = VFX_IMP_DEATH;
        }
        break;
        case SPELLABILITY_GAZE_DOMINATE:
        {
            nSavingThrow = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            nImmunity = IMMUNITY_TYPE_DOMINATE;
            nEffectType = EFFECT_TYPE_DOMINATED;
            nVis = VFX_IMP_DOMINATE_S;
        }
        break;
        case SPELLABILITY_GAZE_DOOM:
        {
            nSavingThrow = SAVING_THROW_WILL;
            nEffectType = LINK_EFFECT_DOOM;
            nVis = VFX_IMP_DOOM;
        }
        break;
        case SPELLABILITY_GAZE_FEAR:
        {
            nSavingThrow = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_FEAR;
            nImmunity = IMMUNITY_TYPE_FEAR;
            nEffectType = EFFECT_TYPE_FRIGHTENED;
            nVis = VFX_IMP_FEAR_S;
        }
        break;
        case SPELLABILITY_GAZE_PARALYSIS:
        {
            nSavingThrow = SAVING_THROW_WILL;
            nImmunity = IMMUNITY_TYPE_PARALYSIS;
            nEffectType = EFFECT_TYPE_PARALYZE;
        }
        break;
        // case SPELLABILITY_GAZE_PETRIFY: // In op_s_petrify for now
        case SPELLABILITY_GAZE_STUNNED:
        {
            nSavingThrow = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            nImmunity = IMMUNITY_TYPE_STUN;
            nEffectType = EFFECT_TYPE_STUNNED;
            nVis = VFX_IMP_STUN;
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Debug("[op_a_gaze] No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
            return;
        }
        break;
    }

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        SignalSpellCastAt();

        // Immunity checks
        if (GetCanSee(oTarget) &&
           (nGoodEvilAlignmentRequired == -1 || GetAlignmentGoodEvil(oTarget) == nGoodEvilAlignmentRequired) &&
           (nLawChaosAlignmentRequired == -1 || GetAlignmentLawChaos(oTarget) == nLawChaosAlignmentRequired) &&
           (nImmunity == -1 || GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity)))
        {
            if (!DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType, fDelay))
            {
                if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));

                if (nEffectType == EFFECT_TYPE_DEATH)
                {
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oTarget));
                }
                else
                {
                    effect eApply;
                    if (nImmunity == -1)
                    {
                        eApply = SupernaturalEffect(GetEffectLink(nEffectType));
                    }
                    else
                    {
                        eApply = SupernaturalEffect(GetEffectLinkIgnoreImmunity(nEffectType));
                    }
                    float fDuration = GetDuration(nDuration, ROUNDS, nEffectType);

                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eApply, oTarget, fDuration));
                }
            }
        }
    }
}

