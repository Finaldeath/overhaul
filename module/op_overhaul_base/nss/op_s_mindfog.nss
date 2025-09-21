//::///////////////////////////////////////////////
//:: Mind Fog
//:: op_s_mindfog
//:://////////////////////////////////////////////
/*
    This spell creates a bank of blue fog that saps the will of all those who
    enter it. Victims take a -10 penalty on Will saving throws. This penalty
    persists for as long as the creature remains in the fog and for an
    additional 2d6 rounds upon leaving.
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

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            SignalSpellCastAt();

            // NB we set a variable to sort the "will save" part. We will
            // simply reuse this if they enter again.
            int nWillSaveResult = GetLocalInt(OBJECT_SELF, ObjectToString(oTarget));

            effect eLink = EffectLinkEffects(EffectSavingThrowDecrease(SAVING_THROW_WILL, 10),
                                             EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE));

            if (nWillSaveResult == SAVE_NOT_DONE_YET)
            {
                // Set we've saved (2) now and reset to 1 if not saved further down
                int nSavedResult = SAVE_RESULT_PASSED;
                if (!DoResistSpell(oTarget, oCaster))
                {
                    if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_MIND_SPELLS))
                    {
                        if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS))
                        {
                            // Simplfied version is we apply this permanently but On Exit apply it for 2d6 more rounds
                            ApplyAOEPersistentEffect(oTarget, eLink);
                            nSavedResult = SAVE_RESULT_FAILED;
                        }
                    }
                }
                SetLocalInt(OBJECT_SELF, ObjectToString(oTarget), nSavedResult);
            }
            // Failed, so reapply
            else if (nWillSaveResult == SAVE_RESULT_FAILED)
            {
                // Remove anything that is tagged with our OID (see below - we use this OnExit)
                RemoveEffectsFromSpell(oTarget, nSpellId, EFFECT_TYPE_ALL, ObjectToString(OBJECT_SELF));

                ApplyAOEPersistentEffect(oTarget, eLink);
            }
            // 2 = resisted/saved already
            else if (nWillSaveResult == SAVE_RESULT_PASSED)
            {
                SendMessageToPCByStrRef(oTarget, STRREF_PREVIOUSLY_SAVED_NOW_IMMUNE);
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        RemovePersistentAOEEffects(oTarget);

        // We just care if we have a failed save. Due to how the engine works multiple
        // negative will saves will not matter since they're from the same spell id
        // which is handy. We tag it with our OID to remove later however if they
        // re-enter.
        if (GetLocalInt(OBJECT_SELF, ObjectToString(oTarget)) == SAVE_RESULT_FAILED)
        {
            effect eLink = EffectLinkEffects(EffectSavingThrowDecrease(SAVING_THROW_WILL, 10),
                           EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE),
                                             EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));

            // Extraordinary prevents dispel magic
            eLink = ExtraordinaryEffect(eLink);
            // Tagged with our AOE OID to remove if they trigger the OnEnter again (Won't matter if
            // this AOE just ended/was dispelled/etc.)
            eLink = TagEffect(eLink, ObjectToString(OBJECT_SELF));

            // For now applying all metamagic like Bioware did. Ho hum.
            int nDuration = GetDiceRoll(2, 6);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nDuration, ROUNDS));
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;
    }
    else
    {
        if (DoSpellHook()) return;

        ApplyVisualEffectAtLocation(VFX_FNF_GAS_EXPLOSION_MIND, lTarget);

        effect eAOE = EffectAreaOfEffect(AOE_PER_FOGMIND, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(1 + (nCasterLevel / 2), ROUNDS, TRUE, FALSE));
    }
}

