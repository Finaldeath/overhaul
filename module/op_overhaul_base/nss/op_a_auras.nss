//::///////////////////////////////////////////////
//:: Auras
//:: op_a_auras
//:://////////////////////////////////////////////
/*
    Difficulty Class, where applicable: 10 + 1 for every 3 HD.
    Duration, where applicable: 1 round for every 3 HD.
    Damage, where applicable: 1d6 + 1d6 for every 3 HD.

    Some creatures are able to project a 10-foot radius field of protective
    energy that has an effect on any enemies that come within range. The
    following types of Auras are available in the game:

    Aura of Cold, Aura of Fire, Aura of Lightning: Damaging auras.
    Aura of Blinding: Enemies entering the aura are blinded.
    Aura of Fear and Dragon Fear: Enemies entering the aura are stricken with fear.
    Aura of Menace: Enemies entering the aura are stricken with the effects of
        a Doom spell.
    Aura of Protection: The caster is protected as if he had a Circle of
        Protection - Evil and Globe of Invulnerability in place.
    Aura of Stunning: Enemies entering the aura are stunned.
    Aura of Unearthly Visage: The caster appears so beautiful or so ugly that
        creature entering the aura must save or die.
    Aura of the Unnatural: All animals are instantly stricken with fear.
    Miscellaneous: Tyrantfog (5-foot radius of green mist that saps the
        Constitution of all creatures within its grasp. Fortitude save at DC 13
        to resist).
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"
#include "utl_i_timer"

void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER ||
        GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;

        // Duration, DC and Damage amount are standardised
        // Difficulty Class, where applicable: 10 + 1 for every 3 HD.
        // Duration, where applicable: 1 round for every 3 HD.
        // Damage, where applicable: 1d6 + 1d6 for every 3 HD.
        int nVariable = GetHitDice(oCaster)/3;
        int nDC = 10 + nVariable;
        int nDamageType, nDamageDice = 0, nDamageDiceSize = 4; // If nDamageDice is set just do damage
        int nDuration = max(1, nVariable);
        int nDurationType = ROUNDS;
        int nEffectType = EFFECT_TYPE_INVALIDEFFECT; // If damage dice is not set apply this effect, or eLink if not set

        effect eLink;
        int nSavingThrow = SAVING_THROW_NONE, nSavingThrowType = SAVING_THROW_TYPE_NONE;
        int nVis = VFX_NONE;
        int nImmunity = IMMUNITY_TYPE_NONE;

        // Effect depends on the ability
        switch (nSpellId)
        {
            case SPELLABILITY_AURA_BLINDING:
            {
                nSavingThrow = SAVING_THROW_WILL;
                nImmunity = IMMUNITY_TYPE_BLINDNESS;
                nVis = VFX_IMP_BLIND_DEAF_M;
                eLink = EffectLinkEffects(EffectBlindness(),
                                          EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
            }
            break;
            case SPELLABILITY_AURA_COLD:
            {
                // (1 + 1/3 level)d4
                nDamageDice = 1 + nVariable;
                nDamageType = DAMAGE_TYPE_COLD;
                nSavingThrow = SAVING_THROW_FORT;
                nSavingThrowType = SAVING_THROW_TYPE_COLD;
                nVis = VFX_IMP_FROST_S;
            }
            break;
            case SPELLABILITY_DRAGON_FEAR:
            {
                nDC = 10 + (GetHitDice(oCaster)/2) + GetAbilityModifier(ABILITY_CHARISMA, oCaster);
                nDuration = min(20, GetHitDice(oCaster));

                // From Bioware's script for XP3 I think:
                // Yaron does not like the stunning beauty of a very specific dragon to
                // last more than 10 rounds ....
                if (GetTag(GetAreaOfEffectCreator()) == "q3_vixthra")
                {
                    nDuration = 3 + d6();
                }
                nSavingThrow = SAVING_THROW_WILL;
                nSavingThrowType = SAVING_THROW_TYPE_FEAR;
                nEffectType = EFFECT_TYPE_FRIGHTENED;
                nImmunity = IMMUNITY_TYPE_FEAR;
            }
            break;
            case SPELLABILITY_AURA_ELECTRICITY:
            {
                // (1 + 1/3 level)d4
                nDamageDice = 1 + nVariable;
                nDamageType = DAMAGE_TYPE_ELECTRICAL;
                nSavingThrow = SAVING_THROW_FORT;
                nSavingThrowType = SAVING_THROW_TYPE_ELECTRICITY;
                nVis = VFX_IMP_LIGHTNING_S;
            }
            break;
            case SPELLABILITY_AURA_FEAR:
            {
                nSavingThrow = SAVING_THROW_WILL;
                nSavingThrowType = SAVING_THROW_TYPE_FEAR;
                nEffectType = EFFECT_TYPE_FRIGHTENED;
                nImmunity = IMMUNITY_TYPE_FEAR;
            }
            break;
            case SPELLABILITY_AURA_FIRE:
            {
                // (1 + 1/3 level)d4
                nDamageDice = 1 + nVariable;
                nDamageType = DAMAGE_TYPE_FIRE;
                nSavingThrow = SAVING_THROW_FORT;
                nSavingThrowType = SAVING_THROW_TYPE_FIRE;
                nVis = VFX_IMP_FLAME_S;
            }
            break;
            case SPELLABILITY_AURA_HORRIFICAPPEARANCE:
            {
                nSavingThrow = SAVING_THROW_FORT;
                nVis = VFX_IMP_REDUCE_ABILITY_SCORE;
                eLink = EffectLinkEffects(EffectAbilityDecrease(ABILITY_STRENGTH, d8(2)),
                                          EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
                // From original script
                nDC = 11;
                nDuration = max(1, FloatToInt(GetChallengeRating(oCaster)) * 3);
            }
            break;
            case SPELLABILITY_AURA_MENACE:
            {
                nSavingThrow = SAVING_THROW_WILL;
                nVis  = VFX_IMP_DOOM;
                eLink = EffectLinkEffects(EffectSavingThrowDecrease(SAVING_THROW_ALL, 2),
                        EffectLinkEffects(EffectAttackDecrease(2),
                        EffectLinkEffects(EffectDamageDecrease(2, DAMAGE_TYPE_BLUDGEONING | DAMAGE_TYPE_SLASHING | DAMAGE_TYPE_PIERCING),
                        EffectLinkEffects(EffectSkillDecrease(SKILL_ALL_SKILLS, 2),
                                          EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)))));
            }
            break;
            case SPELLABILITY_AURA_PROTECTION:
            {
                // Don't run HB - just in case catch
                if (GetCurrentlyRunningEvent() != EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER) return;

                // Just apply the persistent effect here and exit
                eLink = EffectLinkEffects(EffectSpellLevelAbsorption(3, 0),
                        EffectLinkEffects(VersusAlignmentEffect(EffectACIncrease(2, AC_DEFLECTION_BONUS), ALIGNMENT_ALL, ALIGNMENT_EVIL),
                        EffectLinkEffects(VersusAlignmentEffect(EffectSavingThrowIncrease(SAVING_THROW_ALL, 2), ALIGNMENT_ALL, ALIGNMENT_EVIL),
                        EffectLinkEffects(VersusAlignmentEffect(EffectImmunity(IMMUNITY_TYPE_MIND_SPELLS), ALIGNMENT_ALL, ALIGNMENT_EVIL),
                        EffectLinkEffects(EffectVisualEffect(VFX_DUR_GLOBE_MINOR),
                        EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROTECTION_GOOD_MINOR),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)))))));

                if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_ALLALLIES))
                {
                    ApplyAOEPersistentEffect(oTarget, eLink);
                }
                return;
            }
            break;
            case SPELLABILITY_AURA_STUN:
            {
                nSavingThrow = SAVING_THROW_WILL;
                nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
                nEffectType = EFFECT_TYPE_STUNNED;
                nImmunity = IMMUNITY_TYPE_STUN;
            }
            break;
            case SPELLABILITY_AURA_UNEARTHLY_VISAGE:
            {
                nVis = VFX_IMP_DEATH;
                nEffectType = EFFECT_TYPE_DEATH;
                nImmunity = IMMUNITY_TYPE_DEATH;
            }
            break;
            case SPELLABILITY_AURA_UNNATURAL:
            {
                // Vs Animals only
                if (GetRacialType(oTarget) != RACIAL_TYPE_ANIMAL) return;

                nSavingThrow = SAVING_THROW_WILL;
                nSavingThrowType = SAVING_THROW_TYPE_FEAR;
                nEffectType = EFFECT_TYPE_FRIGHTENED;
                nImmunity = IMMUNITY_TYPE_FEAR;
            }
            break;
            case SPELLABILITY_TROGLODYTE_STENCH:
            {
                // Troglodytes are immune
                switch (GetAppearanceType(oTarget))
                {
                    case APPEARANCE_TYPE_TROGLODYTE:
                    case APPEARANCE_TYPE_TROGLODYTE_CLERIC:
                    case APPEARANCE_TYPE_TROGLODYTE_WARRIOR:
                        return;
                    break;
                }
                nSavingThrow = SAVING_THROW_FORT;
                nSavingThrowType = SAVING_THROW_TYPE_POISON;
                nImmunity = IMMUNITY_TYPE_POISON;
                nVis = VFX_IMP_REDUCE_ABILITY_SCORE;
                eLink = EffectLinkEffects(EffectAbilityDecrease(ABILITY_STRENGTH, d6()),
                                          EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
                // From original script
                nDC = 13;
                nDuration = 10;
            }
            break;
            default:
            {
                Debug("[op_s_auras] IMPACT AREA: No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
                return;
            }
            break;
        }

        json jArray = GetArrayOfAOETargets(SPELL_TARGET_SELECTIVEHOSTILE);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt();

            if (GetTimerEnded(ObjectToString(oTarget)))
            {
                // If we have damage we just do it (5 second timer)
                if (nDamageDice > 0)
                {
                    SetTimer(ObjectToString(oTarget), 5);

                    int nDamage = DoDamageSavingThrow(GetDiceRoll(nDamageDice, nDamageDiceSize), oTarget, oCaster, nSavingThrow, nDC, nSavingThrowType);

                    if (nDamage > 0){
                    {
                        float fDelay = (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT) ? GetRandomDelay() : 0.0;

                        DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, nVis, nDamage, nDamageType));
                    }
                }
                else
                {
                    // Else we set a timer for 24 hours so we don't trigger it again
                    SetTimer(ObjectToString(oTarget), 24 * 60 * 60);

                    if (!GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity))
                    {
                        if (!DoSavingThrow(oTarget, oCaster, nSavingThrow, nDC, nSavingThrowType))
                        {
                            ApplyVisualEffectToObject(nVis, oTarget);

                            float fDuration = 0.0;

                            switch (nEffectType)
                            {
                                case EFFECT_TYPE_FRIGHTENED:
                                {
                                    // Scaled effect
                                    eLink = EffectLinkEffects(GetScaledEffect(EffectFrightened(), oTarget),
                                            EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR),
                                                              EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));

                                    fDuration = GetScaledDuration(oTarget, nDuration, nDurationType);
                                }
                                break;
                                case EFFECT_TYPE_STUNNED:
                                {
                                    nVis = VFX_IMP_STUN;
                                    eLink = EffectLinkEffects(GetScaledEffect(EffectStunned(), oTarget),
                                            EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED),
                                                              EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));

                                    fDuration = GetScaledDuration(oTarget, nDuration, nDurationType);
                                }
                                break;
                                case EFFECT_TYPE_DEATH:
                                {
                                    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oTarget);
                                    return;
                                }
                                break;
                                default:
                                {
                                    fDuration = GetDuration(nDuration, nDurationType);
                                }
                                break;
                            }
                            // Supernatural auras mean supernatural effects
                            eLink = SupernaturalEffect(eLink);

                            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
                        }
                    }
                }
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        RemovePersistentAOEEffects(oTarget);
    }
    else
    {
        if (DoSpellHook()) return;

        effect eAOE;
        // NB as an extra optimisation we remove any scripts we don't need to fire.
        switch (nSpellId)
        {
            case SPELLABILITY_AURA_BLINDING:
            {
                eAOE = EffectAreaOfEffect(AOE_MOB_BLINDING, GetScriptName(), "", "");
            }
            break;
            case SPELLABILITY_AURA_COLD:
            {
                eAOE = EffectAreaOfEffect(AOE_MOB_FROST, GetScriptName(), GetScriptName(), "");
            }
            break;
            case SPELLABILITY_DRAGON_FEAR:
            {
                eAOE = EffectAreaOfEffect(AOE_MOB_DRAGON_FEAR, GetScriptName(), "", "");
            }
            break;
            case SPELLABILITY_AURA_ELECTRICITY:
            {
                eAOE = EffectAreaOfEffect(AOE_MOB_ELECTRICAL, GetScriptName(), GetScriptName(), "");
            }
            break;
            case SPELLABILITY_AURA_FEAR:
            {
                eAOE = EffectAreaOfEffect(AOE_MOB_FEAR, GetScriptName(), "", "");
            }
            break;
            case SPELLABILITY_AURA_FIRE:
            {
                eAOE = EffectAreaOfEffect(AOE_MOB_FIRE, GetScriptName(), GetScriptName(), "");
            }
            break;
            case SPELLABILITY_AURA_HORRIFICAPPEARANCE:
            {
                eAOE = EffectAreaOfEffect(AOE_MOB_HORRIFICAPPEARANCE, GetScriptName(), "", "");
            }
            break;
            case SPELLABILITY_AURA_MENACE:
            {
                eAOE = EffectAreaOfEffect(AOE_MOB_MENACE, GetScriptName(), "", "");
            }
            break;
            case SPELLABILITY_AURA_PROTECTION:
            {
                eAOE = EffectAreaOfEffect(AOE_MOB_PROTECTION, GetScriptName(), "", GetScriptName());
            }
            break;
            case SPELLABILITY_AURA_STUN:
            {
                eAOE = EffectAreaOfEffect(AOE_MOB_STUN, GetScriptName(), "", "");
            }
            break;
            case SPELLABILITY_AURA_UNEARTHLY_VISAGE:
            {
                eAOE = EffectAreaOfEffect(AOE_MOB_UNEARTHLY, GetScriptName(), "", "");
            }
            break;
            case SPELLABILITY_AURA_UNNATURAL:
            {
                eAOE = EffectAreaOfEffect(AOE_MOB_UNNATURAL, GetScriptName(), "", "");
            }
            break;
            case SPELLABILITY_TROGLODYTE_STENCH:
            {
                eAOE = EffectAreaOfEffect(AOE_MOB_TROGLODYTE_STENCH, GetScriptName(), "", "");
            }
            break;
            default:
            {
                Debug("[op_s_auras] No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
                return;
            }
            break;
        }

        // Undispellable and lasts through resting
        eAOE = SupernaturalEffect(eAOE);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAOE, oTarget);
    }
}
