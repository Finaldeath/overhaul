//::///////////////////////////////////////////////
//:: Battletide
//:: op_s_battletide
//:://////////////////////////////////////////////
/*
    You create an aura that steals energy from your enemies. Your enemies suffer
    a -2 circumstance penalty on saves, attack rolls, and damage rolls, once
    entering the aura. On casting, you gain a +2 circumstance bonus to your
    saves, attack rolls, and damage rolls.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (!AOECheck()) return;

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_SELECTIVEHOSTILE))
        {
            SignalSpellCastAt(oTarget, oCaster, TRUE);

            // Check for previous pass/fail.
            // NB we set a variable to sort the "will save" part. We will
            // simply reuse this if they enter again.
            int nSaveResult = GetLocalInt(OBJECT_SELF, ObjectToString(oTarget));

            effect eLink = EffectLinkEffects(EffectDamageDecrease(2, DAMAGE_TYPE_BLUDGEONING | DAMAGE_TYPE_SLASHING | DAMAGE_TYPE_PIERCING),
                           EffectLinkEffects(EffectSavingThrowDecrease(SAVING_THROW_ALL, 2),
                           EffectLinkEffects(EffectAttackDecrease(2),
                                             EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE))));

            if (nSaveResult == SAVE_NOT_DONE_YET)
            {
                // Set we've saved (2) now and reset to 1 if not saved further down
                int nSavedResult = SAVE_RESULT_PASSED;

                // Always a save regardless of status to caster
                if (!DoResistSpell(oTarget, oCaster))
                {
                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC))
                    {
                        ApplyVisualEffectToObject(VFX_IMP_DOOM, oTarget);
                        ApplyAOEPersistentEffect(oTarget, eLink);
                        nSavedResult = SAVE_RESULT_FAILED;
                    }
                }
                SetLocalInt(OBJECT_SELF, ObjectToString(oTarget), nSavedResult);
            }
            // Failed, so reapply
            else if (nSaveResult == SAVE_RESULT_FAILED)
            {
                ApplyVisualEffectToObject(VFX_IMP_DOOM, oTarget);
                ApplyAOEPersistentEffect(oTarget, eLink);
            }
            // 2 = resisted/saved already
            else if (nSaveResult == SAVE_RESULT_PASSED)
            {
                SendMessageToPCByStrRef(oTarget, STRREF_PREVIOUSLY_SAVED_NOW_IMMUNE); // *You previously saved and so are immune to this spell*
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        RemovePersistentAOEEffects(oTarget);
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;
    }
    else
    {
        if (DoSpellHook()) return;

        // Remove existing (good) castings
        RemoveEffectsFromSpell(oTarget, nSpellId, EFFECT_TYPE_AREA_OF_EFFECT);

        effect eLink = EffectLinkEffects(EffectAreaOfEffect(AOE_MOB_TIDE_OF_BATTLE, GetScriptName(), GetScriptName(), GetScriptName()),
                       EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, 2),
                       EffectLinkEffects(EffectAttackIncrease(2),
                       EffectLinkEffects(EffectDamageIncrease(2, DAMAGE_TYPE_BLUDGEONING | DAMAGE_TYPE_SLASHING | DAMAGE_TYPE_PIERCING),
                       EffectLinkEffects(EffectIcon(EFFECT_ICON_AREA_OF_EFFECT),
                                         EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))))));

        SignalSpellCastAt(oTarget, oCaster, FALSE);
        ApplyVisualEffectToObject(VFX_IMP_HOLY_AID, oTarget);
        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, ROUNDS));
    }
}

