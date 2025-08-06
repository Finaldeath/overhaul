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

            int nAmount = GetDiceRoll(max(1, GetHitDice(oCaster)/3), 6);

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

            eLink = SupernaturalEffect(EffectAbilityDecrease(nAbility, nAmount));
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
            eLink = SupernaturalEffect(EffectLinkEffects(GetScaledEffect(EFFECT_TYPE_CHARMED, oTarget),
                                                         EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
            fDuration = GetScaledDuration(oTarget, (1 + GetHitDice(oCaster))/2, ROUNDS);
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
            eLink = SupernaturalEffect(EffectLinkEffects(GetScaledEffect(EFFECT_TYPE_CONFUSED, oTarget),
                                       EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED),
                                                         EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE))));
            nImmunity = IMMUNITY_TYPE_CONFUSED;
            nVis = VFX_IMP_CONFUSION_S;
        }
        break;
        case SPELLABILITY_BOLT_DAZE:
        {
            bApplyEffect = TRUE;
            eLink = SupernaturalEffect(EffectLinkEffects(EffectDazed(),
                                       EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED),
                                                         EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE))));
            nImmunity = IMMUNITY_TYPE_CONFUSED;
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
                    DelayCommand(0.0, ApplyDamageWithVFXToObject(oTarget, nVis, nDamage, nDamageType));
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

