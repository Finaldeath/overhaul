//::///////////////////////////////////////////////
//:: AOE Effect
//:: op_s_aoeeffect.nss
//:://////////////////////////////////////////////
/*
    AOEs that do a particular effect. IE Saving throw or X.
    Make any effects ignore immunity since we do an nImmunity check. This stops
    people pausing and equipping an item that grants that immunity during
    gameplay.

    Balagarn's Iron Horn
    You create a deep, resonant vibration that can shake creatures off their
    feet as if they were being knocked over. If they are flying or floating
    they are immune to this effect.

    Make a single Strength check as if your Strength were 20. Creatures in the
    area make individual opposed Dexterity or Strength checks against your roll.
    Every creature that falls will be knocked down for one round.

    Wail of the Banshee
    The character emits a terrible scream that kills creatures that hear it
    (except for the character).
    All creatures that are not deaf or silenced within the area of effect must
    succeed at a Fortitude save or die, to a maximum of 1 enemy per caster level.

    Bombardment
    Damage and knockdown.

    Prayer
    All allies within the area of effect gain +1 to attack and damage rolls,
    skill checks, and saving throws. Enemies receive -1 penalties to the same.

    War Cry
    The caster lets out a powerful shout that grants the Bard a +2 bonus to
    attack and damage. All enemies within the area of effect are stricken with fear.

    Hammer of the Gods
    The caster smites a group of creatures with divine light for 1d8 points of
    damage for every two caster levels, to a maximum of 5d8. Any creature in
    the area that make a Will save take half damage and avoid being dazed for
    1d6 rounds (the random duration cannot be extended, empowered or maximized).

    Sound Burst
    All creatures within the area of effect take 1d8 points of sonic damage and
    must make a Will save or be stunned for 2 rounds.
    Creatures that cannot hear are not stunned but are still damaged.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Optional damage?
    int nDamageType = -1, nDiceNum, nDiceSize;
    int bSaveForDamage = TRUE;
    // Strength ability check result?
    int nStrengthCheckRoll = -1;
    // Saving throw and immunity?
    int nSavingThrow = -1, nSavingThrowType = SAVING_THROW_TYPE_NONE;
    int nImmunity = IMMUNITY_TYPE_NONE, nEffectOnlyImmunity = IMMUNITY_TYPE_NONE;
    int bImmuneIfFlying = FALSE, bImmuneIfCannotHear = FALSE;
    int bImmuneToEffectsIfCannotHear = FALSE; // Still does damage
    // Effect we apply on a failed save
    effect eLink;
    float fExtraDelay = 0.0;
    // Duration calculation. If 0 it applies eLink instantly. Not maximised or empowered.
    int nDurationBase, nDurationType, nDurationDice, nDurationDiceSize;
    // VFX
    int nImpact = VFX_NONE, nVis = VFX_NONE, nDamVis = VFX_NONE, bDelayRandom = FALSE;
    float fImpactScale = 1.0;
    // Can change to selective hostile
    int nTargetType    = SPELL_TARGET_STANDARDHOSTILE;
    int nCreatureLimit = 99999;

    // These effects are applied in a second loop of only real allies (Prayer and
    // the like).
    int bAlliedLink = FALSE;
    int nAlliedVis;
    effect eAlliedLink;

    switch (nSpellId)
    {
        case SPELL_BALAGARNSIRONHORN:
        {
            nStrengthCheckRoll = d20() + 5; // 20 Strength is +5
            nImmunity          = IMMUNITY_TYPE_KNOCKDOWN;
            bImmuneIfFlying    = TRUE;
            nImpact            = VFX_FNF_SCREEN_SHAKE;
            nVis               = VFX_IMP_HEAD_NATURE;
            eLink              = EffectLinkEffects(IgnoreEffectImmunity(EffectKnockdown()),
                                                   EffectLinkEffects(EffectIcon(EFFECT_ICON_KNOCKDOWN),
                                                                     EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
            nDurationBase      = 1;
            nDurationType      = ROUNDS;
        }
        break;
        case SPELL_WAIL_OF_THE_BANSHEE:
        {
            nImmunity           = IMMUNITY_TYPE_DEATH;
            bImmuneIfCannotHear = TRUE;
            nSavingThrow        = SAVING_THROW_FORT;
            nSavingThrowType    = SAVING_THROW_TYPE_DEATH;
            nImpact             = VFX_FNF_WAIL_O_BANSHEES;
            nVis                = VFX_IMP_DEATH;
            eLink               = IgnoreEffectImmunity(EffectDeath());
            fExtraDelay         = 3.0;
            nCreatureLimit      = nCasterLevel;
        }
        break;
        case SPELL_BOMBARDMENT:
        {
            nSavingThrow   = SAVING_THROW_REFLEX;
            nImpact        = VFX_FNF_METEOR_SWARM; // TODO update to less firey VFX
            fImpactScale   = 0.5; // Make it smaller due to altered AOE sizing
            nVis           = VFX_IMP_FLAME_M;      // TODO update to less firey VFX
            nEffectOnlyImmunity = IMMUNITY_TYPE_KNOCKDOWN;
            eLink          = EffectLinkEffects(IgnoreEffectImmunity(EffectKnockdown()), EffectIcon(EFFECT_ICON_KNOCKDOWN));
            nDurationBase  = 2;
            nDurationType  = ROUNDS;
            bDelayRandom   = TRUE;
            nDamageType    = DAMAGE_TYPE_BLUDGEONING;
            nDiceNum       = min(20, nCasterLevel);
            nDiceSize      = 8;
        }
        break;
        case SPELL_PRAYER:
        {
            nTargetType      = SPELL_TARGET_SELECTIVEHOSTILE;
            nImpact          = VFX_FNF_LOS_HOLY_30;
            nVis             = VFX_IMP_DOOM;
            eLink            = EffectLinkEffects(EffectAttackDecrease(1),
                               EffectLinkEffects(EffectSavingThrowDecrease(SAVING_THROW_ALL, 1),
                               EffectLinkEffects(EffectDamageDecrease(1, DAMAGE_TYPE_BLUDGEONING | DAMAGE_TYPE_SLASHING | DAMAGE_TYPE_PIERCING),
                               EffectLinkEffects(EffectSkillDecrease(SKILL_ALL_SKILLS, 1),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)))));
            nDurationBase = nCasterLevel;
            nDurationType = ROUNDS;
            bAlliedLink      = TRUE;
            nAlliedVis       = VFX_IMP_HOLY_AID;
            eAlliedLink      = EffectLinkEffects(EffectAttackIncrease(1),
                               EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, 1),
                               EffectLinkEffects(EffectDamageIncrease(1, DAMAGE_TYPE_BLUDGEONING | DAMAGE_TYPE_SLASHING | DAMAGE_TYPE_PIERCING),
                               EffectLinkEffects(EffectSkillIncrease(SKILL_ALL_SKILLS, 1),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)))));
        }
        break;
        case SPELL_WAR_CRY:
        {
            if (GetGender(oCaster) == GENDER_FEMALE)
            {
                nImpact = VFX_FNF_HOWL_WAR_CRY_FEMALE;
            }
            else
            {
                nImpact = VFX_FNF_HOWL_WAR_CRY;
            }

            bImmuneIfCannotHear = TRUE;
            nImmunity        = IMMUNITY_TYPE_FEAR;
            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_FEAR;
            nTargetType      = SPELL_TARGET_SELECTIVEHOSTILE;
            nDurationBase = 4;
            nDurationType = ROUNDS;
            eLink            = EffectLinkEffects(EffectFrightened(),
                               EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));

            eAlliedLink      = EffectLinkEffects(EffectAttackIncrease(2),
                               EffectLinkEffects(EffectDamageIncrease(2, DAMAGE_TYPE_BLUDGEONING | DAMAGE_TYPE_SLASHING | DAMAGE_TYPE_PIERCING),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));

            // Apply some effects just to the caster/shouter
            ApplyVisualEffectToObject(VFX_IMP_HEAD_SONIC, oCaster);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eAlliedLink, oCaster, GetDuration(nCasterLevel, ROUNDS));
        }
        break;
        case SPELL_HAMMER_OF_THE_GODS:
        {
            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_DIVINE;
            nImpact          = VFX_FNF_STRIKE_HOLY;
            nVis             = VFX_IMP_DIVINE_STRIKE_HOLY;
            nEffectOnlyImmunity = IMMUNITY_TYPE_DAZED;
            eLink            = EffectLinkEffects(IgnoreEffectImmunity(EffectDazed()),
                               EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
            nDurationDice    = 1;
            nDurationDiceSize = 6;
            nDurationType  = ROUNDS;
            nDamageType    = DAMAGE_TYPE_DIVINE;
            nDiceNum       = clamp(nCasterLevel/2, 1, 5);
            nDiceSize      = 8;
        }
        break;
        case SPELL_SOUND_BURST:
        {
            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_SONIC;
            bImmuneToEffectsIfCannotHear = TRUE;
            bSaveForDamage   = FALSE;
            nImpact          = VFX_FNF_SOUND_BURST;
            nVis             = VFX_IMP_SONIC;
            nEffectOnlyImmunity = IMMUNITY_TYPE_STUN;
            eLink            = EffectLinkEffects(IgnoreEffectImmunity(EffectStunned()),
                               EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
            nDurationBase = 2;
            nDurationType = ROUNDS;
            nDamageType      = DAMAGE_TYPE_SONIC;
            nDiceNum         = 1;
            nDiceSize        = 8;
        }
        break;
        default:
            Debug("[op_s_aoeeffect] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
            break;
    }

    ApplyVisualEffectAtLocation(nImpact, lTarget, FALSE, fImpactScale);

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = bDelayRandom ? GetRandomDelay(0.4, 1.75) : GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        fDelay += fExtraDelay;

        if (nCreatureLimit > 0)
        {
            nCreatureLimit--;

            if (!DoResistSpell(oTarget, oCaster, fDelay))
            {
                if (!GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity) &&
                    (!bImmuneIfFlying || !GetIsFlying(oTarget)) &&
                    (!bImmuneIfCannotHear || GetCanHear(oTarget)))
                {
                    // Saving throw or strength check?
                    int bSaved = FALSE;
                    if (nSavingThrow != -1)
                    {
                        bSaved = DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType, fDelay);
                    }
                    else if (nStrengthCheckRoll != -1)
                    {
                        // Ability check
                        bSaved = DoAbilityCheck(oTarget, oCaster, nStrengthCheckRoll, ABILITY_STRENGTH, ABILITY_DEXTERITY);
                    }

                    // Damage?
                    if (nDamageType != -1)
                    {
                        int nDamage = GetDiceRoll(nDiceNum, nDiceSize);

                        if (bSaveForDamage && nSavingThrow != -1)
                        {
                            nDamage = GetDamageBasedOnFeats(nDamage, oTarget, nSavingThrow, bSaved);
                        }

                        if (nDamage > 0)
                        {
                            if (nDamVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nDamVis, oTarget));
                            DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage, nDamageType));
                        }
                    }

                    if (!bSaved && !GetIsImmuneWithFeedback(oTarget, oCaster, nEffectOnlyImmunity) && (!bImmuneToEffectsIfCannotHear || GetCanHear(oTarget)))
                    {
                        if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));

                        // Got duration?
                        float fDuration = 0.0;
                        if (nDurationDice > 0 || nDurationBase > 0)
                        {
                            float fDuration = GetDuration(GetDiceRoll(nDurationDice, nDurationDiceSize, nDurationBase, FALSE), nDurationType);
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
    }

    // We do a second loop for allies if we have a link to apply to them.
    if (bAlliedLink)
    {
        jArray = GetArrayOfTargets(SPELL_TARGET_ALLALLIES, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt();

            float fDelay = bDelayRandom ? GetRandomDelay(0.4, 1.75) : GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

            fDelay += fExtraDelay;

            if (nCreatureLimit > 0)
            {
                nCreatureLimit--;

                if (nAlliedVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nAlliedVis, oTarget));

                float fDuration = 0.0;
                if (nDurationDice > 0 || nDurationBase > 0)
                {
                    float fDuration = GetDuration(GetDiceRoll(nDurationDice, nDurationDiceSize, nDurationBase, FALSE), nDurationType);
                }

                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eAlliedLink, oTarget, fDuration));
            }
        }
    }
}
