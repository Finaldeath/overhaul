//::///////////////////////////////////////////////
//:: Ghoul Touch
//:: op_s_ghoultouch
//:://////////////////////////////////////////////
/*
    The caster's hand glows with an unearthly radiance. The target creature must
    make a Fortitude save or become paralyzed. Creatures paralyzed by this spell
    emit a noxious cloud that applies a -2 penalty to skills, saving throws,
    attack and damage rolls to all creatures within 5 feet.
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

        // Special: If this is the object that has been paralysed with the AOE
        // we can check for this, and we just assume they've failed since, well,
        // they have (this is mainly relevant in case they are immune to paralysis).
        int bFailOverride = FALSE;
        effect eCheck = GetFirstEffect(oTarget);
        while (GetIsEffectValid(eCheck))
        {
            if (GetEffectType(eCheck) == EFFECT_TYPE_AREA_OF_EFFECT &&
                GetEffectSpellId(eCheck) == nSpellId &&
                GetEffectObject(eCheck, 0) == OBJECT_SELF)
            {
                bFailOverride = TRUE;
                break;
            }
            eCheck = GetNextEffect(oTarget);
        }

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            SignalSpellCastAt();

            effect eLink = EffectLinkEffects(EffectAttackDecrease(2),
                           EffectLinkEffects(EffectDamageDecrease(2, DAMAGE_TYPE_BLUDGEONING | DAMAGE_TYPE_SLASHING | DAMAGE_TYPE_PIERCING),
                           EffectLinkEffects(EffectSavingThrowDecrease(SAVING_THROW_ALL, 2),
                           EffectLinkEffects(EffectSkillDecrease(SKILL_ALL_SKILLS, 2),
                                             EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)))));

            // Check for previous pass/fail.
            int nSaveResult = GetLocalInt(OBJECT_SELF, ObjectToString(oTarget));

            if (bFailOverride) nSaveResult = SAVE_RESULT_FAILED;

            if (nSaveResult == SAVE_NOT_DONE_YET)
            {
                // Set we've saved (2) now and reset to 1 if not saved further down
                int nSavedResult = SAVE_RESULT_PASSED;

                // Always a save regardless of status to caster
                if (!DoResistSpell(oTarget, oCaster))
                {
                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_NEGATIVE))
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
                SendMessageToPC(oTarget, "*You previously saved and so are immune to this spell*");
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

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            SignalSpellCastAt(oTarget, oCaster, TRUE);

            if (!DoResistSpell(oTarget, oCaster))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_NEGATIVE))
                {
                    effect eLink = EffectLinkEffects(EffectAreaOfEffect(AOE_PER_FOGGHOUL, GetScriptName(), GetScriptName(), GetScriptName()),
                                   EffectLinkEffects(EffectIcon(EFFECT_ICON_AREA_OF_EFFECT),
                                                     EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));

                    effect eParalysis = GetEffectLink(EFFECT_TYPE_PARALYZE, oTarget);

                    int nDuration = GetDiceRoll(1, 6, 2);
                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetScaledDuration(oTarget, nDuration, ROUNDS));
                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eParalysis, oTarget, GetScaledDuration(oTarget, nDuration, ROUNDS));
                }
            }
        }
    }
}

