//:://////////////////////////////////////////////
//:: Item Properties: General
//:: op_ip_general
//:://////////////////////////////////////////////
/*
    General item properties used for things like Alcahol, grenades etc.

    AOE items are in op_ip_generalaoe like Caltrops.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    switch (nSpellId)
    {
        case SPELL_ITEM_ALCOHOL_BEER:
        case SPELL_ITEM_ALCOHOL_WINE:
        case SPELL_ITEM_ALCOHOL_SPIRITS:
        {
            // Note: This never used to fire the OnSpellCastAt so we'll do the
            // same and ignore that SignalEvent since it keeps it consistent.

            if (Random(100) + 1 < 40)
                AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING));
            else
                AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK));

            // This is not used in the original script but might be useful to
            // re-enable at some point
            // AssignCommand(oTarget,ActionSpeakStringByStrRef(STRREF_BURP));

            // Effects based on the alcohol type
            int nValue;
            if (nSpellId == SPELL_ITEM_ALCOHOL_BEER) { nValue = 1; }
            else if (nSpellId == SPELL_ITEM_ALCOHOL_WINE) { nValue = 2; }
            else if (nSpellId == SPELL_ITEM_ALCOHOL_SPIRITS) { nValue = 3; }

            // Keep it super simple no cessation it's not a "spell"
            effect eApply = ExtraordinaryEffect(EffectAbilityDecrease(ABILITY_INTELLIGENCE, nValue));

            // TODO: Maybe have it ignore effect immunities but then you can't
            // really get drunk as a undead monster can you?
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eApply, oTarget, 60.0);
        }
        break;
        case SPELL_ITEM_BELLADONNA:
        {
            float fDuration = RoundsToSeconds(10);
            effect eLink = EffectLinkEffects(VersusRacialTypeEffect(EffectACIncrease(5), RACIAL_TYPE_SHAPECHANGER),
                                             EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            // Cannot dispel item effects
            eLink = ExtraordinaryEffect(eLink);

            ApplyVisualEffectToObject(VFX_IMP_AC_BONUS, oTarget);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
        }
        case SPELL_ITEM_GARLIC:
        {
            float fDuration = RoundsToSeconds(10);
            // NB: you always get bad breath, ignore any immunities!
            effect eLink = EffectLinkEffects(VersusRacialTypeEffect(EffectAttackIncrease(2), RACIAL_TYPE_UNDEAD),
                           EffectLinkEffects(IgnoreEffectImmunity(EffectAbilityDecrease(ABILITY_CHARISMA, 1)),
                                             EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            // Cannot dispel item effects
            eLink = ExtraordinaryEffect(eLink);

            ApplyVisualEffectToObject(VFX_IMP_AC_BONUS, oTarget);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
        }
        break;
        case SPELL_ITEM_ALCHEMISTS_FIRE:
        {
            // Applies flaming attacks to an item, or does a grenade explosion
            if (GetObjectType(oTarget) == OBJECT_TYPE_ITEM)
            {
                if (GetItemIsMelee(oTarget))
                {
                    itemproperty ipProperty1 = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ONHIT_FIREDAMAGE, 1);
                    itemproperty ipProperty2 = ItemPropertyVisualEffect(ITEM_VISUAL_FIRE);
                    float fDuration = GetDuration(4, ROUNDS);
                    if (GetCanApplySafeItemProperty(oTarget, ipProperty1))
                    {
                        ApplySafeItemProperty(oTarget, ipProperty1, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic, FALSE);
                        ApplyItemProperty(oTarget, ipProperty2, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic, FALSE);
                        if (GetIsObjectValid(GetItemPossessor(oTarget)))
                        {
                            ApplyVisualEffectToObject(VFX_IMP_PULSE_FIRE, GetItemPossessor(oTarget));
                        }
                        else
                        {
                            ApplyVisualEffectToObject(VFX_IMP_PULSE_FIRE, oTarget);
                        }
                    }
                }
                else
                {
                    FloatingTextStrRefOnCreature(STRREF_ONLY_MELEE_WEAPONS_CAN_BE_COATED_WITH_ALCHEMISTS_FIRE, oCaster); // *  Only melee weapons can be coated with alchemist's fire! *
                }
            }
            else
            {
                // Extra direct damage if target is valid
                int nTargetDamage = 0;
                object oMainTarget = oTarget;
                if (GetIsObjectValid(oTarget))
                {
                    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
                    {
                        int nTouch = DoTouchAttack(oTarget, oCaster, TOUCH_RANGED);
                        if (nTouch)
                        {
                            nTargetDamage = nTouch == TOUCH_RESULT_CRITICAL_HIT ? 2 : 1;
                        }
                    }
                }

                // AOE grenade
                ApplyVisualEffectAtLocation(VFX_FNF_FIREBALL, lTarget);
                json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE | OBJECT_TYPE_DOOR);
                int nIndex;
                for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
                {
                    oTarget = GetArrayObject(jArray, nIndex);

                    SignalSpellCastAt();

                    float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget)) / 20.0;

                    int nDamage = 1;

                    if (oTarget == oMainTarget) nDamage += nTargetDamage;

                    DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_FLAME_M, oTarget));
                    DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_FIRE));
                }
            }
        }
        break;
        case SPELL_ITEM_TANGLEFOOT_BAG:
        {
            if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
            {
                effect eLink = GetEffectLink(EFFECT_TYPE_ENTANGLE);

                // Items are not "spells" and cannot be dispelled
                eLink = ExtraordinaryEffect(eLink);

                SignalSpellCastAt();

                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, 15))
                {
                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(2, ROUNDS));
                }
            }
        }
        break;
        case SPELL_ITEM_HOLY_WATER:
        {
            // Extra direct damage if target is valid
            int nTargetDamage = 0;
            object oMainTarget = oTarget;
            if (GetIsObjectValid(oTarget) && GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
            {
                if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
                {
                    int nTouch = DoTouchAttack(oTarget, oCaster, TOUCH_RANGED);
                    if (nTouch)
                    {
                        nTargetDamage = nTouch == TOUCH_RESULT_CRITICAL_HIT ? 2 : 1;
                    }
                }
            }

            // AOE grenade
            ApplyVisualEffectAtLocation(VFX_FNF_LOS_NORMAL_20, lTarget);
            json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
            int nIndex;
            for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
            {
                oTarget = GetArrayObject(jArray, nIndex);

                if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
                {
                    SignalSpellCastAt();

                    float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget)) / 20.0;

                    int nDamage = d4(2);

                    if (oTarget == oMainTarget) nDamage += nTargetDamage;

                    DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_HEAD_HOLY, oTarget));
                    DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_DIVINE));
                }
            }
        }
        break;
        case SPELL_ITEM_THUNDERSTONE:
        {
            ApplyVisualEffectAtLocation(VFX_FNF_LOS_NORMAL_30, lTarget);
            ApplyVisualEffectAtLocation(VFX_FNF_SCREEN_SHAKE, lTarget);

            effect eLink = GetEffectLink(EFFECT_TYPE_DEAF);
            float fDuration = GetDuration(5, ROUNDS);

            json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
            int nIndex;
            for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
            {
                oTarget = GetArrayObject(jArray, nIndex);

                // From the Bioware version
                if (oTarget != oCaster)
                {
                    SignalSpellCastAt();

                    float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget)) / 20.0;

                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, 15, SAVING_THROW_TYPE_NONE, fDelay))
                    {
                        DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_HEAD_NATURE, oTarget));
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                    }
                }
            }
        }
        break;
        case SPELL_ITEM_ACID_FLASK:
        {
            // Extra direct damage if target is valid
            int nTargetDamage = 0;
            object oMainTarget = oTarget;
            if (GetIsObjectValid(oTarget))
            {
                if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
                {
                    int nTouch = DoTouchAttack(oTarget, oCaster, TOUCH_RANGED);
                    if (nTouch)
                    {
                        nTargetDamage = nTouch == TOUCH_RESULT_CRITICAL_HIT ? 2 : 1;
                    }
                }
            }

            // AOE grenade
            ApplyVisualEffectAtLocation(VFX_FNF_LOS_NORMAL_30, lTarget); // Could use a new VFX
            json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE | OBJECT_TYPE_DOOR);
            int nIndex;
            for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
            {
                oTarget = GetArrayObject(jArray, nIndex);

                SignalSpellCastAt();

                float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget)) / 20.0;

                int nDamage = d6();

                if (oTarget == oMainTarget) nDamage += nTargetDamage;

                DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_ACID_L, oTarget));
                DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_ACID));
            }
        }
        break;
        case SPELL_ITEM_GRENADE_CHICKEN:
        {
            // This is the same as the original, with lots of kludge removed
            // see x0_s3_gag.nss. Basically it's 1d6 damage to a single target.
            if(GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
            {
                int nTouch = DoTouchAttack(oTarget, oCaster, TOUCH_RANGED);
                ApplyVisualEffectAtLocation(VFX_FNF_FIREBALL, lTarget);

                if (nTouch >= 0)
                {
                    // Roll damage
                    int nDamage = d6(1);

                    if(nTouch == TOUCH_RESULT_CRITICAL_HIT)
                    {
                        nDamage *= 2;
                    }

                    ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_FIRE);
                    ApplyVisualEffectToObject(VFX_IMP_FLAME_S, oTarget);
                }
            }
        }
        break;
        case SPELLABILITY_ROGUES_CUNNING:
        {
            // or "Potion of Extra Thieving"
            effect eLink = EffectLinkEffects(EffectSkillIncrease(SKILL_SEARCH, 10),
                           EffectLinkEffects(EffectSkillIncrease(SKILL_DISABLE_TRAP, 10),
                           EffectLinkEffects(EffectSkillIncrease(SKILL_MOVE_SILENTLY, 10),
                           EffectLinkEffects(EffectSkillIncrease(SKILL_OPEN_LOCK, 5),
                           EffectLinkEffects(EffectSkillIncrease(SKILL_PICK_POCKET, 10),
                           EffectLinkEffects(EffectSkillIncrease(SKILL_SET_TRAP, 10),
                           EffectLinkEffects(EffectSkillIncrease(SKILL_HIDE, 10),
                                             EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))))))));

            float fDuration = GetDuration(5, MINUTES);

            ApplyVisualEffectToObject(VFX_IMP_MAGICAL_VISION, oTarget);

            // We'll treat this as a spell for the purposes of dispelling
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
        }
        break;
        case SPELL_IOUN_STONE_BLUE:
        case SPELL_IOUN_STONE_DEEP_RED:
        case SPELL_IOUN_STONE_DUSTY_ROSE:
        case SPELL_IOUN_STONE_PALE_BLUE:
        case SPELL_IOUN_STONE_PINK:
        case SPELL_IOUN_STONE_PINK_GREEN:
        case SPELL_IOUN_STONE_SCARLET_BLUE:
        {
            // Remove all current stone effects
            effect eEffect = GetFirstEffect(oTarget);
            while (GetIsEffectValid(eEffect))
            {
                switch (GetEffectSpellId(eEffect))
                {
                    case SPELL_IOUN_STONE_BLUE:
                    case SPELL_IOUN_STONE_DEEP_RED:
                    case SPELL_IOUN_STONE_DUSTY_ROSE:
                    case SPELL_IOUN_STONE_PALE_BLUE:
                    case SPELL_IOUN_STONE_PINK:
                    case SPELL_IOUN_STONE_PINK_GREEN:
                    case SPELL_IOUN_STONE_SCARLET_BLUE:
                        RemoveEffect(oTarget, eEffect);
                    break;
                }
                eEffect = GetNextEffect(oTarget);
            }

            int nVis;
            switch (nSpellId)
            {
                case SPELL_IOUN_STONE_BLUE:         eEffect = EffectAbilityIncrease(ABILITY_WISDOM, 2);
                                                    nVis = VFX_DUR_IOUNSTONE_BLUE; break;
                case SPELL_IOUN_STONE_DEEP_RED:     eEffect = EffectAbilityIncrease(ABILITY_DEXTERITY, 2);
                                                    nVis = VFX_DUR_IOUNSTONE_RED; break;
                case SPELL_IOUN_STONE_DUSTY_ROSE:   eEffect = EffectACIncrease(1, AC_DEFLECTION_BONUS);
                                                    nVis = VFX_DUR_IOUNSTONE_YELLOW; break; // Not sure why this VFX isn't "dusty rose"
                case SPELL_IOUN_STONE_PALE_BLUE:    eEffect = EffectAbilityIncrease(ABILITY_STRENGTH, 2);
                                                    nVis = VFX_DUR_IOUNSTONE_BLUE; break;
                case SPELL_IOUN_STONE_PINK:         eEffect = EffectAbilityIncrease(ABILITY_CONSTITUTION, 2);
                                                    nVis = VFX_DUR_IOUNSTONE_RED; break;
                case SPELL_IOUN_STONE_PINK_GREEN:   eEffect = EffectAbilityIncrease(ABILITY_CHARISMA, 2);
                                                    nVis = VFX_DUR_IOUNSTONE_GREEN; break; // Could use a pink/green version
                case SPELL_IOUN_STONE_SCARLET_BLUE: eEffect = EffectAbilityIncrease(ABILITY_INTELLIGENCE, 2);
                                                    nVis = VFX_DUR_IOUNSTONE_BLUE; break;
            }
            // Not dispellable. Or if we do make it disepllable we need to up
            // the caster level.
            effect eLink = ExtraordinaryEffect(EffectLinkEffects(eEffect,
                                                                 EffectVisualEffect(nVis, 2)));
            // 3600 is a lot of time! It's a literal hour, not an in-game hour.
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, 3600.0);
        }
        break;
        default:
            Debug("[op_ip_general] No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
            return;
        break;
    }
}

