//::///////////////////////////////////////////////
//:: Buffs
//:: op_s_buffs
//:://////////////////////////////////////////////
/*
    Various buff spells throw them all in this huge file. They have a set
    duration, affect either the target creature or allies in an area, and
    generally apply one visual and one linked set of buff effects nothing
    too complicated (like mobile AOEs or affecting enemies with things).

    Undeaths Eternal Foe
    All allies in the area of effect will receive the following bonuses: +100%
    immunity to negative damage, immunity to death magic, immunity to
    level/energy drain, immunity to ability score decreases, immunity to fear,
    immunity to poisons, immunity to diseases and a +4 deflection bonus to AC.

    Mage Armor
    +4 AC enchantment bonus.

    Greater Mage Armor
    +6 AC enchantment bonus.

    Epic Mage Armor
    Specifics: The caster gets a +20 armor AC enchantment bonus 1 hour/level.

    True Strike
    +20 to hit for 9 seconds.

    Bless
    +1 attack and +1 will save vs. fear, for 1 minute/level to allies in area.

    Divine Favour
    +1 attack and weapon damage (not magical!) per 3 levels, max +3. 1 minute.

    Ghostly Visage
    Damage reduction 5/+1, prevents all spells of level 1 or lower from
    affecting the caster, and grants 10% concealment. 1 minute/level.

    Ethereal Visage
    Damage reduction 20/+3, prevents all spells of level 2 or lower from
    affecting the caster and provides a 25% concealment bonus. 1 round/level.

    Shadow Shield
    +5 natural AC bonus, 10 / +3 Damage reduction, Immunity to instant death
    effects, Immunity to Necromancy spells, +100% Immunity to Negative Energy
    Damage. 1 round/level.

    Death Ward
    Immunity to death magic. 1 hour/level.

    Aura of Vitality
    +4 Str, Dex, Con for allies, max 1 ally/3 levels. 1 round/level.

    Barkskin
    Natural AC bonus: Level 1-6: +3, Level 7-12: +4, Levels 13+: +5. 1 hour/level.

    Blood Frenzy
    The caster gains a +2 bonus to Strength and Constitution and a +1 bonus to
    Will saves, while suffering a -1 penalty to AC.

    The Ability Score Buffs
    1d4 + 1 or 2d4 + 1 (Greater version) or Caster Level / 2 (Owl's Insight)
    bonus to ability score. Removes previous. 1 hour/level.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Toggles
    int bImpact = FALSE, bDelayRandom = FALSE;
    int nImpact = VFX_INVALID, nVis = VFX_INVALID;
    int nCreatureLimit = 99999;
    effect eLink;
    float fDuration;

    switch (nSpellId)
    {
        case SPELL_UNDEATHS_ETERNAL_FOE:
        {
            nImpact = VFX_FNF_LOS_HOLY_30;
            nVis = VFX_IMP_HOLY_AID;
            eLink = EffectLinkEffects(EffectDamageImmunityIncrease(DAMAGE_TYPE_NEGATIVE, 100),
                    EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_NEGATIVE_LEVEL),
                    EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_ABILITY_DECREASE),
                    EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_POISON),
                    EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_DISEASE),
                                      EffectACIncrease(4,AC_DEFLECTION_BONUS))))));
            fDuration = GetDuration(nCasterLevel, ROUNDS);
        }
        break;
        case SPELL_MAGE_ARMOR:
        {
            nVis = VFX_IMP_AC_BONUS;
            eLink = EffectLinkEffects(EffectACIncrease(4, AC_ARMOUR_ENCHANTMENT_BONUS),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);
        }
        break;
        case SPELL_GREATER_MAGE_ARMOR:
        {
            nVis = VFX_IMP_AC_BONUS;
            eLink = EffectLinkEffects(EffectACIncrease(6, AC_ARMOUR_ENCHANTMENT_BONUS),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);
        }
        break;
        case SPELL_EPIC_MAGE_ARMOR:
        {
            // Need to rework the DUR VFX model properly and have a VIS version added
            // since the current version applies a effect right on the casters head
            nVis = VFX_DUR_PROT_EPIC_ARMOR;
            eLink = EffectLinkEffects(EffectACIncrease(20, AC_ARMOUR_ENCHANTMENT_BONUS),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            // Cannot be dispelled but lost on rest
            eLink = ExtraordinaryEffect(eLink);
            fDuration = GetDuration(nCasterLevel, HOURS);
        }
        break;
        case SPELL_TRUE_STRIKE:
        {
            nVis = VFX_IMP_HEAD_ODD;
            eLink = EffectLinkEffects(EffectAttackIncrease(20),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = 9.0;
        }
        break;
        case SPELL_BLESS:
        {
            // Special case: Blessed Bolts
            if(GetIsObjectValid(oTarget) && GetObjectType(oTarget) == OBJECT_TYPE_ITEM)
            {
                FireItemPropertySpellScript();
                return;
            }
            nImpact = VFX_FNF_LOS_HOLY_30;
            nVis = VFX_IMP_HEAD_HOLY;
            eLink = EffectLinkEffects(EffectAttackIncrease(1),
                    EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, 1, SAVING_THROW_TYPE_FEAR),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            fDuration = GetDuration(nCasterLevel, MINUTES);
        }
        break;
        case SPELL_DIVINE_FAVOR:
        {
            nVis = VFX_IMP_HEAD_HOLY;

            int nBonus = clamp(nCasterLevel/3, 1, 3);
            int nDamageBonus;
            switch (nBonus)
            {
                case 1: nDamageBonus = DAMAGE_BONUS_1; break;
                case 2: nDamageBonus = DAMAGE_BONUS_2; break;
                case 3: nDamageBonus = DAMAGE_BONUS_3; break;
            }
            // Physical damage bonus not magical
            eLink = EffectLinkEffects(EffectAttackIncrease(nBonus),
                    EffectLinkEffects(EffectDamageIncrease(nDamageBonus, DAMAGE_TYPE_BLUDGEONING | DAMAGE_TYPE_SLASHING | DAMAGE_TYPE_PIERCING),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            fDuration = GetDuration(1, MINUTES);
        }
        break;
        case SPELL_GHOSTLY_VISAGE:
        {
            eLink = EffectLinkEffects(EffectDamageReduction(5, DAMAGE_POWER_PLUS_ONE),
                    EffectLinkEffects(EffectSpellLevelAbsorption(1),
                    EffectLinkEffects(EffectConcealment(10),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)))));
            fDuration = GetDuration(nCasterLevel, MINUTES);
        }
        break;
        case SPELL_ETHEREAL_VISAGE:
        {
            eLink = EffectLinkEffects(EffectDamageReduction(20, DAMAGE_POWER_PLUS_THREE),
                    EffectLinkEffects(EffectSpellLevelAbsorption(2),
                    EffectLinkEffects(EffectConcealment(25),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_ETHEREAL_VISAGE),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)))));
            fDuration = GetDuration(nCasterLevel, ROUNDS);
        }
        break;
        case SPELL_SHADOW_SHIELD:
        {
            nVis = VFX_IMP_DEATH_WARD;
            eLink = EffectLinkEffects(EffectDamageReduction(10, DAMAGE_POWER_PLUS_THREE),
                    EffectLinkEffects(EffectACIncrease(5, AC_NATURAL_BONUS),
                    EffectLinkEffects(EffectSpellLevelAbsorption(9, 0, SPELL_SCHOOL_NECROMANCY),
                    EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_DEATH),
                    EffectLinkEffects(EffectDamageImmunityIncrease(DAMAGE_TYPE_NEGATIVE, 100),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)))))));
            fDuration = GetDuration(nCasterLevel, ROUNDS);
        }
        break;
        case SPELL_DEATH_WARD:
        {
            nVis = VFX_IMP_DEATH_WARD;
            eLink = EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_DEATH),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);
        }
        break;
        case SPELL_AURA_OF_VITALITY:
        {
            nImpact = VFX_FNF_NATURES_BALANCE; // Needs unique VFX
            nVis = VFX_IMP_IMPROVE_ABILITY_SCORE;
            nCreatureLimit = max(1, nCasterLevel/3);
            bDelayRandom = TRUE;
            eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_STRENGTH, 4),
                    EffectLinkEffects(EffectAbilityIncrease(ABILITY_DEXTERITY, 4),
                    EffectLinkEffects(EffectAbilityIncrease(ABILITY_CONSTITUTION, 4),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))));
            fDuration = GetDuration(nCasterLevel, ROUNDS);
        }
        break;
        case SPELL_BARKSKIN:
        {
            nVis = VFX_IMP_HEAD_NATURE;
            int nBonus = 3;
            if (nCasterLevel >= 7 && nCasterLevel <= 12) nBonus = 4;
            else if (nCasterLevel >= 13) nBonus = 5;
            eLink = EffectLinkEffects(EffectACIncrease(nBonus, AC_NATURAL_BONUS),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROT_BARKSKIN),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            fDuration = GetDuration(nCasterLevel, HOURS);
        }
        break;
        case SPELL_BLOOD_FRENZY:
        {
            nVis = VFX_IMP_IMPROVE_ABILITY_SCORE;
            int nBonus = 3;
            if (nCasterLevel >= 7 && nCasterLevel <= 12) nBonus = 4;
            else if (nCasterLevel >= 13) nBonus = 5;
            eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_STRENGTH, 2),
                    EffectLinkEffects(EffectAbilityIncrease(ABILITY_CONSTITUTION, 2),
                    EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_WILL, 1),
                    EffectLinkEffects(IgnoreEffectImmunity(EffectACDecrease(1, AC_DODGE_BONUS)),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)))));
            fDuration = GetDuration(nCasterLevel, HOURS);

            // Special!
            PlayVoiceChat(VOICE_CHAT_BATTLECRY1);
        }
        break;
        case SPELL_BULLS_STRENGTH:
        case SPELL_GREATER_BULLS_STRENGTH:
        {
            nVis = VFX_IMP_IMPROVE_ABILITY_SCORE;
            int nBonus = nSpellId == SPELL_BULLS_STRENGTH ? GetDiceRoll(1, 4, 1) : GetDiceRoll(2, 4, 1);

            eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_STRENGTH, nBonus),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);

            // Remove previous castings
            RemoveEffectsFromSpell(oTarget, SPELL_BULLS_STRENGTH);
            RemoveEffectsFromSpell(oTarget, SPELL_GREATER_BULLS_STRENGTH);
        }
        break;
        case SPELL_CATS_GRACE:
        case SPELL_GREATER_CATS_GRACE:
        {
            nVis = VFX_IMP_IMPROVE_ABILITY_SCORE;
            int nBonus = nSpellId == SPELL_CATS_GRACE ? GetDiceRoll(1, 4, 1) : GetDiceRoll(2, 4, 1);

            eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_DEXTERITY, nBonus),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);

            // Remove previous castings
            RemoveEffectsFromSpell(oTarget, SPELL_CATS_GRACE);
            RemoveEffectsFromSpell(oTarget, SPELL_GREATER_CATS_GRACE);
        }
        break;
        case SPELL_EAGLE_SPLEDOR:
        case SPELL_GREATER_EAGLE_SPLENDOR:
        {
            nVis = VFX_IMP_IMPROVE_ABILITY_SCORE;
            int nBonus = nSpellId == SPELL_EAGLE_SPLEDOR ? GetDiceRoll(1, 4, 1) : GetDiceRoll(2, 4, 1);

            eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_CHARISMA, nBonus),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);

            // Remove previous castings
            RemoveEffectsFromSpell(oTarget, SPELL_EAGLE_SPLEDOR);
            RemoveEffectsFromSpell(oTarget, SPELL_GREATER_EAGLE_SPLENDOR);
        }
        break;
        case SPELL_ENDURANCE:
        case SPELL_GREATER_ENDURANCE:
        {
            nVis = VFX_IMP_IMPROVE_ABILITY_SCORE;
            int nBonus = nSpellId == SPELL_ENDURANCE ? GetDiceRoll(1, 4, 1) : GetDiceRoll(2, 4, 1);

            eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_CONSTITUTION, nBonus),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);

            // Remove previous castings
            RemoveEffectsFromSpell(oTarget, SPELL_ENDURANCE);
            RemoveEffectsFromSpell(oTarget, SPELL_GREATER_ENDURANCE);
        }
        break;
        case SPELL_FOXS_CUNNING:
        case SPELL_GREATER_FOXS_CUNNING:
        {
            nVis = VFX_IMP_IMPROVE_ABILITY_SCORE;
            int nBonus = nSpellId == SPELL_FOXS_CUNNING ? GetDiceRoll(1, 4, 1) : GetDiceRoll(2, 4, 1);

            eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_INTELLIGENCE, nBonus),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);

            // Remove previous castings
            RemoveEffectsFromSpell(oTarget, SPELL_FOXS_CUNNING);
            RemoveEffectsFromSpell(oTarget, SPELL_GREATER_FOXS_CUNNING);
        }
        break;
        case SPELL_OWLS_WISDOM:
        case SPELL_GREATER_OWLS_WISDOM:
        case SPELL_OWLS_INSIGHT:
        {
            nVis = VFX_IMP_IMPROVE_ABILITY_SCORE;
            int nBonus;

            if (nSpellId == SPELL_OWLS_INSIGHT)
            {
                nBonus = nCasterLevel / 2;
            }
            else
            {
                nBonus = nSpellId == SPELL_OWLS_WISDOM ? GetDiceRoll(1, 4, 1) : GetDiceRoll(2, 4, 1);
            }

            eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_WISDOM, nBonus),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);

            // Remove previous castings
            RemoveEffectsFromSpell(oTarget, SPELL_OWLS_WISDOM);
            RemoveEffectsFromSpell(oTarget, SPELL_GREATER_OWLS_WISDOM);
            RemoveEffectsFromSpell(oTarget, SPELL_OWLS_INSIGHT);
        }
        break;
        default:
            OP_Debug("[op_s_buffs] No valid spell ID passed in: " + IntToString(nSpellId), LOG_LEVEL_ERROR);
            return;
        break;
    }

    if (GetSpellIsAreaOfEffect(nSpellId))
    {
        if (nImpact != VFX_INVALID) ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(nImpact), lTarget);

        json jArray = GetArrayOfTargets(SPELL_TARGET_ALLALLIES, SORT_METHOD_DISTANCE);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray) && nCreatureLimit > 0; nIndex++)
        {
            nCreatureLimit--;

            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt();

            float fDelay = bDelayRandom ? GetRandomDelay() : GetDistanceBetweenLocations(GetLocation(oTarget), lTarget)/20.0;

            if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
        }
    }
    else
    {
        SignalSpellCastAt();

        ApplyVisualEffectToObject(nVis, oTarget);
        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
    }
}

