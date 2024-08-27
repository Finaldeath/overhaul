//::///////////////////////////////////////////////
//:: Dirge
//:: op_s_dirge
//:://////////////////////////////////////////////
/*
    The caster's song draws the energies of death and destruction. Any enemies
    in the area of effect who can hear the caster singing suffer 2 points of
    Strength and Dexterity ability score damage each round unless they make a
    successful fortitude save. If the enemy leaves the area of effect, their
    Strength and Dexterity are restored.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"
#include "utl_i_timer"

void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (!AOECheck()) return;

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_SELECTIVEHOSTILE))
        {
            SignalSpellCastAt();

            if (GetTimerEnded(ObjectToString(oTarget)))
            {
                SetTimer(ObjectToString(oTarget), 5);

                if (GetCanSpeak(oCaster) && GetCanHear(oTarget))
                {
                    if (!DoResistSpell(oTarget, oCaster))
                    {
                        if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC))
                        {
                            // Remove any existing ability decreases. We have to do this
                            // to apply the AOEPersistentEffect properly.
                            RemoveEffectsFromSpell(oTarget, nSpellId, EFFECT_TYPE_ABILITY_DECREASE, TAG_AOEEFFECT);

                            // Add more on
                            int nAmount = GetLocalInt(OBJECT_SELF, ObjectToString(oTarget));
                            nAmount += 2;
                            SetLocalInt(OBJECT_SELF, ObjectToString(oTarget), nAmount);

                            effect eLink = EffectLinkEffects(EffectAbilityDecrease(ABILITY_STRENGTH, nAmount),
                                                             EffectAbilityDecrease(ABILITY_DEXTERITY, nAmount));

                            ApplyVisualEffectToObject(VFX_IMP_REDUCE_ABILITY_SCORE, oTarget);
                            ApplyAOEPersistentEffect(oTarget, eLink);
                        }
                    }
                }
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        RemovePersistentAOEEffects(oTarget);

        // Remove tracking variable
        if (oTarget != oCaster)
        {
            DeleteLocalInt(OBJECT_SELF, ObjectToString(oTarget));
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;

        if (!GetCanSpeak(oCaster))
        {
            FloatingTextStringOnCreature("*Dirge cannot affect targets if you cannot sing*", oCaster, FALSE);
            return;
        }

        json jArray = GetArrayOfAOETargets(SPELL_TARGET_SELECTIVEHOSTILE);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt();

            if (GetTimerEnded(ObjectToString(oTarget)))
            {
                SetTimer(ObjectToString(oTarget), 5);

                if (GetCanHear(oTarget))
                {
                    // Only used for VFX to not spam an annoying noise/VFX all at the same time
                    float fDelay = GetRandomDelay(0.2, 0.4);

                    if (!DoResistSpell(oTarget, oCaster, fDelay))
                    {
                        if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay))
                        {
                            // Remove any existing ability decreases. We have to do this
                            // to apply the AOEPersistentEffect properly.
                            RemoveEffectsFromSpell(oTarget, nSpellId, EFFECT_TYPE_ABILITY_DECREASE, TAG_AOEEFFECT);

                            // Add more on
                            int nAmount = GetLocalInt(OBJECT_SELF, ObjectToString(oTarget));
                            nAmount += 2;

                            effect eLink = EffectLinkEffects(EffectAbilityDecrease(ABILITY_STRENGTH, nAmount),
                                                             EffectAbilityDecrease(ABILITY_DEXTERITY, nAmount));

                            DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_REDUCE_ABILITY_SCORE, oTarget));
                            ApplyAOEPersistentEffect(oTarget, eLink);
                        }
                    }
                }
            }
        }
    }
    else
    {
        if (DoSpellHook()) return;

        ApplyVisualEffectAtLocation(VFX_FNF_HOWL_MIND, lTarget);
        ApplyVisualEffectToObject(VFX_DUR_BARD_SONG_EVIL, oTarget, FALSE, 6.0);

        effect eAOE = EffectAreaOfEffect(AOE_MOB_CIRCEVIL, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eAOE, oTarget, GetDuration(nCasterLevel, ROUNDS, TRUE, FALSE));
    }
}

