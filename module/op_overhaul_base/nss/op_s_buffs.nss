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
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
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

