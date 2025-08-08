//::///////////////////////////////////////////////
//:: Bolt Abilities
//:: op_a_bolt.nss
//:://////////////////////////////////////////////
/*
    The bolt abiltiies all have similar scaling and effects, primarily a
    effect or damage based on a ranged touch attack to hit.

    Bolt, Ability Drain Charisma, Constitution, Dexterity, Intelligence,
    Strength and Wisdom
        Reduces ability score by d6(nHD/3) (minimum 1d6) as a permanent
        supernatural effect

    Bolt, Acid, Cold, Fire, Shards
        d6(nHD/2) damage of the given type (Shards being +1 Piercing damage)
        Critical hits double the damage

    Bolt, Charm, Confuse, Daze, Death, Disease, Dominate, Knockdown, Level
    Drain, Paralyze, Poison, Slow, Stun, Web
        Applies the given effect. Some have additional damage like Knockdown.
        Duration is usually (nHD + 1) / 2 rounds (will be a supernatural effect)
        Level Drain, Disease and Posion are permanent supernatural effects instead.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nTouchAttackType = TOUCH_RANGED;
    // Immunity?
    int nImmunity = IMMUNITY_TYPE_NONE;

    int nDice;
    int nDiceSize = 6;
    int nDamageType;
    int nDamagePower = DAMAGE_POWER_ENERGY;

    // Effect to apply if target is hit.
    int bApplyEffect = FALSE;
    effect eLink;
    int nSubtype = SUBTYPE_SUPERNATURAL;
    float fDuration = 0.0; // 0.0 will be permanent

    int nVis = VFX_NONE, nBeam = VFX_NONE;
    int nTargetType = SPELL_TARGET_STANDARDHOSTILE;

    switch (nSpellId)
    {
        case SPELLABILITY_BOLT_ABILITY_DRAIN_CHARISMA:
        case SPELLABILITY_BOLT_ABILITY_DRAIN_CONSTITUTION:
        case SPELLABILITY_BOLT_ABILITY_DRAIN_DEXTERITY:
        case SPELLABILITY_BOLT_ABILITY_DRAIN_INTELLIGENCE:
        case SPELLABILITY_BOLT_ABILITY_DRAIN_STRENGTH:
        case SPELLABILITY_BOLT_ABILITY_DRAIN_WISDOM:
        {
            bApplyEffect = TRUE;

            int nAbility;
            switch (nSpellId)
            {
                case SPELLABILITY_BOLT_ABILITY_DRAIN_CHARISMA:     nAbility = ABILITY_CHARISMA; break;
                case SPELLABILITY_BOLT_ABILITY_DRAIN_CONSTITUTION: nAbility = ABILITY_CONSTITUTION; break;
                case SPELLABILITY_BOLT_ABILITY_DRAIN_DEXTERITY:    nAbility = ABILITY_DEXTERITY; break;
                case SPELLABILITY_BOLT_ABILITY_DRAIN_INTELLIGENCE: nAbility = ABILITY_INTELLIGENCE; break;
                case SPELLABILITY_BOLT_ABILITY_DRAIN_STRENGTH:     nAbility = ABILITY_STRENGTH; break;
                case SPELLABILITY_BOLT_ABILITY_DRAIN_WISDOM:       nAbility = ABILITY_WISDOM; break;
            }
            int nAmount = GetDiceRoll(max(1, GetHitDice(oCaster)/3), 6);
            eLink = SupernaturalEffect(EffectAbilityDecrease(nAbility, nAmount));
            nImmunity = IMMUNITY_TYPE_ABILITY_DECREASE;
            nVis = VFX_IMP_NEGATIVE_ENERGY;
        }
        break;
        case SPELLABILITY_BOLT_ACID:
        {
            nDice = max(1, GetHitDice(oCaster)/2);
            nDamageType = DAMAGE_TYPE_ACID;
            nVis = VFX_IMP_ACID_S;
        }
        break;
        case SPELLABILITY_BOLT_CHARM:
        {
            bApplyEffect = TRUE;
            fDuration = GetScaledDuration(oTarget, (1 + GetHitDice(oCaster))/2, ROUNDS);
            eLink = SupernaturalEffect(GetEffectLink(EFFECT_TYPE_CHARMED, oTarget));
            nImmunity = IMMUNITY_TYPE_CHARM;
            nVis = VFX_IMP_CHARM;
        }
        break;
        case SPELLABILITY_BOLT_COLD:
        {
            nDice = max(1, GetHitDice(oCaster)/2);
            nDamageType = DAMAGE_TYPE_COLD;
            nVis = VFX_IMP_FROST_S;
        }
        break;
        case SPELLABILITY_BOLT_CONFUSE:
        {
            bApplyEffect = TRUE;
            fDuration = GetScaledDuration(oTarget, (GetHitDice(oCaster) + 1) / 2, ROUNDS);
            eLink = SupernaturalEffect(GetEffectLink(EFFECT_TYPE_CONFUSED, oTarget));
            nImmunity = IMMUNITY_TYPE_CONFUSED;
            nVis = VFX_IMP_CONFUSION_S;
        }
        break;
        case SPELLABILITY_BOLT_DAZE:
        {
            fDuration = GetDuration((GetHitDice(oCaster) + 1) / 2, ROUNDS);
            bApplyEffect = TRUE;
            eLink = SupernaturalEffect(GetEffectLink(EFFECT_TYPE_DAZED));
            nImmunity = IMMUNITY_TYPE_DAZED;
            nVis = VFX_IMP_DAZED_S;
        }
        break;
        case SPELLABILITY_BOLT_DEATH:
        {
            bApplyEffect = TRUE;
            eLink = SupernaturalEffect(IgnoreEffectImmunity(EffectDeath()));
            nImmunity = IMMUNITY_TYPE_DEATH;
            nVis = VFX_IMP_DEATH;
        }
        break;
        case SPELLABILITY_BOLT_DISEASE:
        {
            bApplyEffect = TRUE;
            // Here we use the racial type of the attacker to select an
            // appropriate disease.
            switch (GetRacialType(oCaster))
            {
                case RACIAL_TYPE_VERMIN:
                    eLink = SupernaturalEffect(EffectDisease(DISEASE_VERMIN_MADNESS));
                break;
                case RACIAL_TYPE_UNDEAD:
                    eLink = SupernaturalEffect(EffectDisease(DISEASE_FILTH_FEVER));
                break;
                case RACIAL_TYPE_OUTSIDER:
                    if(GetTag(oCaster) == "NW_SLAADRED" ||
                       GetAppearanceType(oCaster) == APPEARANCE_TYPE_SLAAD_RED)
                    {
                        eLink = SupernaturalEffect(EffectDisease(DISEASE_RED_SLAAD_EGGS));
                    }
                    else
                    {
                        eLink = SupernaturalEffect(EffectDisease(DISEASE_DEMON_FEVER));
                    }
                break;
                case RACIAL_TYPE_MAGICAL_BEAST:
                    eLink = SupernaturalEffect(EffectDisease(DISEASE_SOLDIER_SHAKES));
                break;
                case RACIAL_TYPE_ABERRATION:
                    eLink = SupernaturalEffect(EffectDisease(DISEASE_BLINDING_SICKNESS));
                break;
                default:
                    eLink = SupernaturalEffect(EffectDisease(DISEASE_SOLDIER_SHAKES));
                break;
            }
            nImmunity = IMMUNITY_TYPE_DISEASE;
        }
        break;
        case SPELLABILITY_BOLT_DOMINATE:
        {
            bApplyEffect = TRUE;
            fDuration = GetDuration((GetHitDice(oCaster) + 1) / 2, ROUNDS);
            eLink = SupernaturalEffect(GetEffectLink(EFFECT_TYPE_DOMINATED, oTarget));
            nImmunity = IMMUNITY_TYPE_DOMINATE;
            nVis = VFX_IMP_DOMINATE_S;
        }
        break;
        case SPELLABILITY_BOLT_FIRE:
        {
            nDice = max(1, GetHitDice(oCaster)/2);
            nDamageType = DAMAGE_TYPE_FIRE;
            nVis = VFX_IMP_FLAME_S;
        }
        break;
        case SPELLABILITY_BOLT_KNOCKDOWN:
        {
            nDice = 1;
            fDuration = GetDuration(3, ROUNDS);
            nDamageType = DAMAGE_TYPE_BLUDGEONING;
            bApplyEffect = TRUE;
            eLink = SupernaturalEffect(GetEffectLink(EFFECT_TYPE_KNOCKDOWN));
            nImmunity = IMMUNITY_TYPE_KNOCKDOWN;
            nVis = VFX_IMP_SONIC;
        }
        break;
        case SPELLABILITY_BOLT_LEVEL_DRAIN:
        {
            bApplyEffect = TRUE;
            eLink = SupernaturalEffect(EffectLinkEffects(EffectNegativeLevel(1),
                                                         EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
            nImmunity = IMMUNITY_TYPE_NEGATIVE_LEVEL;
            nVis = VFX_IMP_NEGATIVE_ENERGY;
        }
        break;
        case SPELLABILITY_BOLT_LIGHTNING:
        {
            nDice = max(1, GetHitDice(oCaster)/2);
            nDamageType = DAMAGE_TYPE_ELECTRICAL;
            nVis = VFX_IMP_LIGHTNING_S;
            nBeam = VFX_BEAM_LIGHTNING;
        }
        break;
        case SPELLABILITY_BOLT_PARALYZE:
        {
            fDuration = GetScaledDuration(oTarget, (GetHitDice(oCaster) + 1) / 2, ROUNDS);
            bApplyEffect = TRUE;
            eLink = SupernaturalEffect(GetEffectLink(EFFECT_TYPE_PARALYZE, oTarget));
            nImmunity = IMMUNITY_TYPE_PARALYSIS;
        }
        break;
        case SPELLABILITY_BOLT_POISON:
        {
            bApplyEffect = TRUE;

            int nHD = GetHitDice(oCaster);
            switch (GetRacialType(oCaster))
            {
                case RACIAL_TYPE_OUTSIDER:
                    if (nHD <= 9)
                    {
                        eLink = EffectPoison(POISON_QUASIT_VENOM);
                    }
                    else if (nHD < 13)
                    {
                        eLink = EffectPoison(POISON_BEBILITH_VENOM);
                    }
                    else
                    {
                        eLink = EffectPoison(POISON_PIT_FIEND_ICHOR);
                    }
                break;
                case RACIAL_TYPE_VERMIN:
                    if (nHD < 3)
                    {
                        eLink = EffectPoison(POISON_TINY_SPIDER_VENOM);
                    }
                    else if (nHD < 6)
                    {
                        eLink = EffectPoison(POISON_SMALL_SPIDER_VENOM);
                    }
                    else if (nHD < 9)
                    {
                        eLink = EffectPoison(POISON_MEDIUM_SPIDER_VENOM);
                    }
                    else if (nHD < 12)
                    {
                        eLink = EffectPoison(POISON_LARGE_SPIDER_VENOM);
                    }
                    else if (nHD < 15)
                    {
                        eLink = EffectPoison(POISON_HUGE_SPIDER_VENOM);
                    }
                    else if (nHD < 18)
                    {
                        eLink = EffectPoison(POISON_GARGANTUAN_SPIDER_VENOM);
                    }
                    else
                    {
                        eLink = EffectPoison(POISON_COLOSSAL_SPIDER_VENOM);
                    }
                break;
                default:
                    if (nHD < 3)
                    {
                        eLink = EffectPoison(POISON_NIGHTSHADE);
                    }
                    else if (nHD < 6)
                    {
                        eLink = EffectPoison(POISON_BLADE_BANE);
                    }
                    else if (nHD < 9)
                    {
                        eLink = EffectPoison(POISON_BLOODROOT);
                    }
                    else if (nHD < 12)
                    {
                        eLink = EffectPoison(POISON_LARGE_SPIDER_VENOM);
                    }
                    else if (nHD < 15)
                    {
                        eLink = EffectPoison(POISON_LICH_DUST);
                    }
                    else if (nHD < 18)
                    {
                        eLink = EffectPoison(POISON_DARK_REAVER_POWDER);
                    }
                    else
                    {
                        eLink = EffectPoison(POISON_BLACK_LOTUS_EXTRACT);
                    }
                break;
            }

            nImmunity = IMMUNITY_TYPE_POISON;
        }
        break;
        case SPELLABILITY_BOLT_SHARDS:
        {
            nDice = max(1, GetHitDice(oCaster)/2);
            nDamageType = DAMAGE_TYPE_PIERCING;
            nDamagePower = DAMAGE_POWER_PLUS_ONE;
        }
        break;
        case SPELLABILITY_BOLT_SLOW:
        {
            bApplyEffect = TRUE;
            fDuration = GetDuration((1 + GetHitDice(oCaster))/2, ROUNDS);
            eLink = SupernaturalEffect(EffectLinkEffects(EffectSlow(),
                                                         EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
            nImmunity = IMMUNITY_TYPE_SLOW;
            nVis = VFX_IMP_SLOW;
        }
        break;
        case SPELLABILITY_BOLT_STUN:
        {
            fDuration = GetScaledDuration(oTarget, (GetHitDice(oCaster) + 1) / 2, ROUNDS);
            bApplyEffect = TRUE;
            eLink = SupernaturalEffect(GetEffectLink(EFFECT_TYPE_STUNNED, oTarget));
            nImmunity = IMMUNITY_TYPE_STUN;
            nVis = VFX_IMP_STUN;
        }
        break;
        case SPELLABILITY_BOLT_WEB:
        {
            fDuration = GetScaledDuration(oTarget, (GetHitDice(oCaster) + 1) / 2, ROUNDS);
            bApplyEffect = TRUE;
            eLink = SupernaturalEffect(EffectLinkEffects(EffectEntangle(),
                                       EffectLinkEffects(EffectVisualEffect(VFX_DUR_WEB),
                                                         EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE))));
            nImmunity = IMMUNITY_TYPE_ENTANGLE;
            nVis = VFX_IMP_STUN;
        }
        break;
        default:
            Debug("[op_a_bolt] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
            break;
    }


    int nDurationType = DURATION_TYPE_PERMANENT;
    if (fDuration > 0.0)
    {
        nDurationType = DURATION_TYPE_TEMPORARY;
    }

    if (GetSpellTargetValid(oTarget, oCaster, nTargetType))
    {
        SignalSpellCastAt();

        int nTouch = DoTouchAttack(oTarget, oCaster, nTouchAttackType);

        if (nTouch)
        {
            ApplyBeamToObject(nBeam, oTarget);

            if (!GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity))
            {
                int bNotAppliedVFX = TRUE;

                if (nDice > 0)
                {
                    int nDamage = GetDiceRoll(nDice, nDiceSize);

                    if (nTouch == TOUCH_RESULT_CRITICAL_HIT) nDamage *= 2;

                    bNotAppliedVFX = FALSE;
                    DelayCommand(0.0, ApplyDamageWithVFXToObject(oTarget, nVis, nDamage, nDamageType, nDamagePower));
                }
                if (bApplyEffect)
                {
                    if (bNotAppliedVFX) ApplyVisualEffectToObject(nVis, oTarget);
                    ApplySpellEffectToObject(nDurationType, eLink, oTarget, fDuration);
                }
            }
        }
        else
        {
            if (nBeam)
            {
                ApplyBeamToObject(nBeam, oTarget, TRUE);
            }
            else
            {
                ApplyVisualEffectToObject(nVis, oTarget, TRUE);
            }
        }
    }
}

