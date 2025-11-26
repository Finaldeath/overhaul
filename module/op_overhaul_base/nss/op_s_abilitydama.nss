//:://////////////////////////////////////////////
//:: Ability Damage spells
//:: op_s_abilitydama
//:://////////////////////////////////////////////
/*
    Spells that just decrease ability scores.

    Feeblemind
    The caster does 1d4 points of Intelligence damage to the creature for every
    4 caster levels. The effect is supernatural and can only be removed by Heal
    or Greater Restoration.

    Ray of Enfeeblement
    The target creature takes 1d6 Strength damage, plus 1 per 2 caster levels,
    to a maximum of +5 damage.
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
    int nBeam = VFX_NONE, nVis = VFX_NONE;
    int nTouchType    = TOUCH_NONE;
    int nImmunityType = IMMUNITY_TYPE_NONE;
    int nSavingThrow = -1, nSavingThrowType = SAVING_THROW_TYPE_NONE;
    int nAbilityToDecrease, nDice, nDiceSize;
    int bSupernatural = FALSE;
    int nDuration, nDurationType = ROUNDS;

    switch (nSpellId)
    {
        case SPELL_FEEBLEMIND:
        {
            nImmunityType    = IMMUNITY_TYPE_MIND_SPELLS;
            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            nVis             = VFX_IMP_REDUCE_ABILITY_SCORE;
            nBeam            = VFX_BEAM_MIND;
            nDice            = max(1, nCasterLevel / 4);
            nDiceSize        = 4;
            nAbilityToDecrease = ABILITY_INTELLIGENCE;
            bSupernatural    = TRUE;
            nDuration        = nCasterLevel / 2;
            nDurationType    = ROUNDS;
        }
        break;
        case SPELL_RAY_OF_ENFEEBLEMENT:
        {
            nSavingThrow     = SAVING_THROW_FORT;
            nSavingThrowType = SAVING_THROW_TYPE_NEGATIVE;
            nVis             = VFX_IMP_REDUCE_ABILITY_SCORE;
            nBeam            = VFX_BEAM_ODD;
            int nDamage      = GetDiceRoll(1, 6, min(5, nCasterLevel / 2));
            eLink            = EffectLinkEffects(EffectAbilityDecrease(ABILITY_STRENGTH, nDamage),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));

            nDuration        = nCasterLevel;
            nDurationType    = ROUNDS;
        }
        break;
        default:
            Debug("[Ability Damage] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
            break;
    }

    // Touch attack
    int nTouchAttack = DoTouchAttack(oTarget, oCaster, nTouchType);

    // Beam regardless of attitude
    if (nBeam != VFX_NONE) ApplyBeamToObject(nBeam, oTarget, !nTouchAttack);

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        if (nTouchAttack)
        {
            if (!DoResistSpell(oTarget, oCaster))
            {
                // Since some effects may have a different immunity check...
                if (!GetIsImmuneWithFeedback(oTarget, oCaster, nImmunityType))
                {
                    if (!DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType))
                    {
                        ApplyVisualEffectToObject(nVis, oTarget);

                        float fDuration = GetDuration(nDuration, nDurationType);
                        int nDamage = GetDiceRoll(nDice, nDiceSize);

                        eLink = EffectLinkEffects(EffectAbilityDecrease(ABILITY_INTELLIGENCE, nDamage),
                                                  EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));

                        if (bSupernatural)
                        {
                            eLink = SupernaturalEffect(eLink);
                        }

                        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
                    }
                }
                else
                {
                    // VFX still applies with feedback message
                    ApplyVisualEffectToObject(nVis, oTarget);
                }
            }
        }
    }
}
