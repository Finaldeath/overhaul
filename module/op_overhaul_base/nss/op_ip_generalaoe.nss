//::///////////////////////////////////////////////
//:: Item Properties
//:: op_ip_generalaoe.nss
//:://////////////////////////////////////////////
/*
    General item properties for AOE effects (ie those with persistent AOEs).
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

        switch (nSpellId)
        {
            case SPELL_ITEM_CHOKING_POWDER:
            {
                if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
                {
                    SignalSpellCastAt();

                    // NB we set a variable to sort the "will save" part. We will
                    // simply reuse this if they enter again.
                    int nSaveResult = GetLocalInt(OBJECT_SELF, ObjectToString(oTarget));

                    effect eLink = EffectLinkEffects(EffectDazed(),
                                                     EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE));

                    if (nSaveResult == SAVE_NOT_DONE_YET)
                    {
                        // Set we've saved (2) now and reset to 1 if not saved further down
                        int nSavedResult = SAVE_RESULT_PASSED;
                        if (!DoResistSpell(oTarget, oCaster))
                        {
                            if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_POISON))
                            {
                                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_POISON))
                                {
                                    // Simplfied version is we apply this permanently but On Exit apply it for 1 more round
                                    ApplyAOEPersistentEffect(oTarget, eLink);
                                    nSavedResult = SAVE_RESULT_FAILED;
                                }
                            }
                        }
                        SetLocalInt(OBJECT_SELF, ObjectToString(oTarget), nSavedResult);
                    }
                    // Failed, so reapply
                    else if (nSaveResult == SAVE_RESULT_FAILED)
                    {
                        // Remove anything that is tagged with our OID (see below - we use this OnExit)
                        RemoveEffectsFromSpell(oTarget, nSpellId, EFFECT_TYPE_ALL, ObjectToString(OBJECT_SELF));

                        ApplyAOEPersistentEffect(oTarget, eLink);
                    }
                    // 2 = resisted/saved already
                    else if (nSaveResult == SAVE_RESULT_PASSED)
                    {
                        SendMessageToPCByStrRef(oTarget, STRREF_PREVIOUSLY_SAVED_NOW_IMMUNE);
                    }
                }
                return;
            }
            break;
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        switch (nSpellId)
        {
            case SPELL_ITEM_CHOKING_POWDER:
            {
                RemovePersistentAOEEffects(oTarget);

                // We just care if we have a failed save. Due to how the engine works multiple
                // negative saves will not matter since they're from the same spell id
                // which is handy. We tag it with our OID to remove later however if they
                // re-enter.
                if (GetLocalInt(OBJECT_SELF, ObjectToString(oTarget)) == SAVE_RESULT_FAILED)
                {

                    effect eLink = EffectLinkEffects(EffectDazed(),
                                   EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE),
                                                     EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));

                    // Extraordinary prevents dispel magic
                    eLink = ExtraordinaryEffect(eLink);
                    // Tagged with our AOE OID to remove if they trigger the OnEnter again (Won't matter if
                    // this AOE just ended/was dispelled/etc.)
                    eLink = TagEffect(eLink, ObjectToString(OBJECT_SELF));

                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(1, ROUNDS));
                }
                // We just care if we have a failed save. Due to how the engine works multiple
                // negative saves will not matter since they're from the same spell id
                // which is handy. We tag it with our OID to remove later however if they
                // re-enter.
                if (GetLocalInt(OBJECT_SELF, ObjectToString(oTarget)) == SAVE_RESULT_FAILED)
                {

                    effect eLink = EffectLinkEffects(EffectDazed(),
                                   EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE),
                                                     EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));

                    // Extraordinary prevents dispel magic
                    eLink = ExtraordinaryEffect(eLink);
                    // Tagged with our AOE OID to remove if they trigger the OnEnter again (Won't matter if
                    // this AOE just ended/was dispelled/etc.)
                    eLink = TagEffect(eLink, ObjectToString(OBJECT_SELF));

                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(1, ROUNDS));
                }
            }
            break;
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;
    }
    else
    {
        if (DoSpellHook()) return;

        int nVis = VFX_NONE;
        effect eAOE;
        float fDuration;
        switch (nSpellId)
        {
            case SPELL_ITEM_CHOKING_POWDER:
            {
                nVis = VFX_FNF_GAS_EXPLOSION_NATURE;
                eAOE = EffectAreaOfEffect(AOE_PER_FOGSTINK, GetScriptName(), GetScriptName(), "");
                fDuration = GetDuration(5, ROUNDS);
            }
            break;
            case SPELL_ITEM_THUNDERSTONE:
            {

            }
            break;
            case SPELL_ITEM_ACID_FLASK:
            {

            }
            break;
            case SPELL_ITEM_GRENADE_CHICKEN:
            {

            }
            break;
            case SPELL_ITEM_CALTROPS:
            {

            }
            break;
            default:
                Debug("[op_ip_generalaoe] No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
                return;
            break;
        }

        ApplyVisualEffectAtLocation(nVis, lTarget);
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, fDuration);
    }
}

