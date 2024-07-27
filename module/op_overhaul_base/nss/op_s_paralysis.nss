//::///////////////////////////////////////////////
//:: Paralysis Spells
//:: op_s_paralysis.nss
//:://////////////////////////////////////////////
/*
    Hold Animal
    The target animal is paralyzed for the duration of the spell.

    Hold Person
    The target humanoid is paralyzed for the duration of the spell.

    Hold Monster
    The target monster is paralyzed for the duration of the spell.

    Solipsism
    Special: Cutscene Paralysis (not removed by most normal means, no saving
    throw each round) and saving throw vs. Mind Spells / Immunity to Mind Spells.
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
    int nImmunity1 = IMMUNITY_TYPE_MIND_SPELLS, nImmunity2 = IMMUNITY_TYPE_PARALYSIS;
    int nSavingThrow = SAVING_THROW_WILL, nSavingThrowType = SAVING_THROW_TYPE_PARALYSIS;
    int nImpact = VFX_NONE, nVis = VFX_NONE;

    effect eLink = EffectLinkEffects(IgnoreEffectImmunity(EffectParalyze()),
                                     EffectLinkEffects(EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE),
                                                       EffectLinkEffects(EffectVisualEffect(VFX_DUR_PARALYZED),
                                                                         EffectVisualEffect(VFX_DUR_PARALYZE_HOLD))));

    // See op_ss_paralysis for why we're storing metadata for this effect
    eLink = EffectTagWithMetadata(eLink);

    // Check target for certain spells
    switch (nSpellId)
    {
        case SPELL_HOLD_ANIMAL:
        {
            if (GetRacialType(oTarget) != CLASS_TYPE_ANIMAL) return;
        }
        break;
        case SPELL_HOLD_PERSON:
        {
            if (!GetIsHumanoidCreature(oTarget)) return;
        }
        break;
        case SPELL_HOLD_MONSTER:
        {
            // Nothing special except object type
            if (GetObjectType(oTarget) != OBJECT_TYPE_CREATURE) return;
        }
        break;
        case SPELL_SOLIPSISM:
        {
            // Special "cutscene paralysis" but do it here with the others
             eLink = EffectLinkEffects(EffectCutsceneParalyze(),
                     EffectLinkEffects(EffectIcon(EFFECT_ICON_PARALYZE),
                     EffectLinkEffects(EffectVisualEffect(VFX_DUR_AURA_PULSE_YELLOW_WHITE),
                                       EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE))));
            nVis = VFX_IMP_HEAD_ODD;
            nImmunity2 = IMMUNITY_TYPE_NONE;
        }
        break;
    }

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(nTargetType);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        if (!DoResistSpell(oTarget, oCaster, fDelay))
        {
            if (!GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity1) &&
                !GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity2))
            {
                if (!DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType, fDelay))
                {
                    float fDuration = GetScaledDuration(oTarget, nCasterLevel, ROUNDS);

                    if (nVis != VFX_NONE) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                }
            }
        }
    }
}
