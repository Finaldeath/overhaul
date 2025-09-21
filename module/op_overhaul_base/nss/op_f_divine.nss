//::///////////////////////////////////////////////
//:: Divine Might and Divine Shield
//:: op_f_divine.nss
//:://////////////////////////////////////////////
/*
    Divine Might

    The character may spend one of his turn undead attempts to add his charisma
    bonus to all weapon damage for a number of rounds equal to the charisma
    bonus.

    Divine Shield

    The character may spend one of his turn undead attempts to add his charisma
    bonus to his armor class for a number of rounds equal to the charisma bonus.

    Divine Wrath

    The Champion is able to channel a portion of their deities's power once per
    day giving them a +3 bonus on attack rolls, damage, and saving throws for a
    number of rounds equal to their Charisma bonus. They also gain damage
    reduction of 5/+1. The attack and saving throw bonuses increase by +2 at level 10
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Needs Turn Undead
    if (!GetHasFeat(FEAT_TURN_UNDEAD, oCaster))
    {
        FloatingTextStrRefOnCreature(STRREF_THIS_ABILITY_IS_TIED_TO_YOUR_TURN_UNDEAD_ABILITY_WHICH_HAS_NO_MORE_USES_FOR_TODAY, oCaster, FALSE); // This ability is tied to your turn undead ability, which has no more uses for today.
    }

    effect eLink;
    int nBonus = GetAbilityModifier(ABILITY_CHARISMA, oCaster);

    // NB: Added 1 more round to the duration so it's more usable (takes a round to cast)
    float fDuration = GetDuration(1 + nBonus, ROUNDS);

    //Check that if nDuration is not above 0, make it 1.
    if(fDuration <= 0.0)
    {
        FloatingTextStrRefOnCreature(STRREF_YOUR_CHARISMA_IS_TOO_LOW_TO_USE_THIS_FEAT, oCaster, FALSE); // * Your charisma is too low to use this feat! *
        return;
    }

    int nVis, nVis2 = VFX_INVALID;

    switch (nSpellId)
    {
        case SPELL_DIVINE_MIGHT:
        {
            nVis = VFX_IMP_SUPER_HEROISM;
            int nDamageBonus = GetDamageBonusValue(nBonus);
            eLink = SupernaturalEffect(EffectLinkEffects(EffectDamageIncrease(nDamageBonus, DAMAGE_TYPE_DIVINE), EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        case SPELL_DIVINE_SHIELD:
        {
            nVis = VFX_IMP_SUPER_HEROISM;
            eLink = SupernaturalEffect(EffectLinkEffects(EffectACIncrease(nBonus), EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        case SPELLABILITY_DC_DIVINE_WRATH:
        {
            nVis = VFX_IMP_HEAD_HOLY;
            nVis2 = VFX_IMP_GOOD_HELP;

            int nLevel = GetLevelByClass(CLASS_TYPE_DIVINECHAMPION, oCaster);
            int nLevelBonus = (nLevel / 5) - 1;
            if (nLevelBonus <= 0)
            {
                // Don't do anything if no levels!
                FloatingTextStrRefOnCreature(STRREF_DIVINE_WRATH_INVALID_USER, oCaster, FALSE); // *Divine Wrath requires Divine Champion levels*
                return;
            }

            int nAttackBonus = 3 + (nLevelBonus * 2); // +2 to attack every 5 levels past 5
            int nSaveBonus = 3 + (nLevelBonus * 2); // +2 to saves every 5 levels past 5
            int nDamageBonus = GetDamageBonusValue(3 + (nLevelBonus * 2)); // +2 to damage every 5 levels past 5

            int nDamageReduction = nLevelBonus * 5;

            // Damage Power
            int nDamageReductionPower = DAMAGE_POWER_PLUS_ONE;
            if (nLevelBonus >= 5)
            {
                nDamageReductionPower = DAMAGE_POWER_PLUS_FIVE;
            }
            else if (nLevelBonus >= 4)
            {
                nDamageReductionPower = DAMAGE_POWER_PLUS_FOUR;
            }
            else if (nLevelBonus >= 3)
            {
                nDamageReductionPower = DAMAGE_POWER_PLUS_THREE;
            }
            else if (nLevelBonus >= 2)
            {
                nDamageReductionPower = DAMAGE_POWER_PLUS_TWO;
            }

            eLink = EffectLinkEffects(EffectAttackIncrease(nAttackBonus, ATTACK_BONUS_MISC),
                    EffectLinkEffects(EffectDamageIncrease(nDamageBonus, DAMAGE_TYPE_DIVINE),
                    EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, nSaveBonus, SAVING_THROW_TYPE_ALL),
                    EffectLinkEffects(EffectDamageReduction(nDamageReduction, nDamageReductionPower),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)))));

            eLink = SupernaturalEffect(eLink);
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Debug("Invalid spell Id", ERROR);
            return;
        }
        break;
    }

    DecrementRemainingFeatUses(oCaster, FEAT_TURN_UNDEAD);

    SignalSpellCastAt();

    // Do not stack
    RemoveEffectsFromSpell(oTarget, nSpellId);

    ApplyVisualEffectToObject(nVis, oTarget);
    if (nVis2 != VFX_INVALID) ApplyVisualEffectToObject(nVis2, oTarget);
    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
}

