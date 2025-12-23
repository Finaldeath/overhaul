//:://////////////////////////////////////////////
//:: Miasmic Cloud
//:: op_s_miasmicclou
//:://////////////////////////////////////////////
/*
    A misty cloud of fog spreads in a medium radius from you when you use this
    invocation. The fog does not block line of sight, but all creatures in the
    fog have concealment. Any creature (other than you) that enters the fog must
    make a Fortitude save or become fatigued. This effect lasts as long as the
    creature remains within the cloud and for 1 round thereafter. A moderate
    wind, or any fire larger than a torch, immediately disperses the fog. The
    fog otherwise lasts for 1 minute.
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

            if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_FATIGUE))
            {
                // NB we set a variable to sort the "for save" part. We will
                // simply reuse this if they enter again.
                int nSaveResult = GetLocalInt(OBJECT_SELF, ObjectToString(oTarget));

                effect eLink = EffectLinkEffects(EffectSavingThrowDecrease(SAVING_THROW_WILL, 10),
                                                 EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE));

                if (nSaveResult == SAVE_NOT_DONE_YET)
                {
                    // Set we've saved (2) now and reset to 1 if not saved further down
                    nSaveResult = SAVE_RESULT_PASSED;
                    if (!DoResistSpell(oTarget, oCaster))
                    {
                        if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC))
                        {
                            // Simplfied version is we apply this permanently but On Exit apply it for 1 more round
                            ApplySpecialAOEPersistentEffect(oTarget, SPELL_EFFECT_FATIGUE);
                            nSaveResult = SAVE_RESULT_FAILED;
                        }
                    }
                    SetLocalInt(OBJECT_SELF, ObjectToString(oTarget), nSaveResult);
                }
                // Failed, so reapply
                else if (nSaveResult == SAVE_RESULT_FAILED)
                {
                    // Remove anything that is tagged with our OID
                    RemoveEffectsFromSpell(oTarget, SPELL_EFFECT_FATIGUE, EFFECT_TYPE_ALL, ObjectToString(OBJECT_SELF));

                    ApplySpecialAOEPersistentEffect(oTarget, SPELL_EFFECT_FATIGUE);
                }
                // 2 = resisted/saved already
                else if (nSaveResult == SAVE_RESULT_PASSED)
                {
                    SendMessageToPCByStrRef(oTarget, STRREF_PREVIOUSLY_SAVED_NOW_IMMUNE);
                }
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        RemovePersistentAOEEffects(oTarget);

        // We just care if we have a failed save.
        // We tag it with our OID to remove later however if they re-enter.
        if (GetLocalInt(OBJECT_SELF, ObjectToString(oTarget)) == SAVE_RESULT_FAILED)
        {
            ApplySpecialEffect(oTarget, SPELL_EFFECT_FATIGUE, RoundsToSeconds(1), SUBTYPE_EXTRAORDINARY, ObjectToString(OBJECT_SELF));
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;
    }
    else
    {
        if (DoSpellHook()) return;

        ApplyVisualEffectAtLocation(VFX_FNF_GAS_EXPLOSION_MIND, lTarget); // TODO new vfx

        effect eAOE = EffectAreaOfEffect(AOE_PER_MIASMICCLOUD, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(1, MINUTES, EFFECT_TYPE_INVALIDEFFECT, FALSE));
    }
}

