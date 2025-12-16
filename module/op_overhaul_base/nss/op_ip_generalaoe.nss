//:://////////////////////////////////////////////
//:: Item Properties: General AOE
//:: op_ip_generalaoe
//:://////////////////////////////////////////////
/*
    General item properties for AOE effects (ie those with persistent AOEs).

    Note that it is silly these disappear when the person throwing them
    dies, but that is just how the game is.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"
#include "utl_i_timer"

const string CALTROPS_TOTAL_DAMAGE = "CALTROPS_TOTAL_DAMAGE";

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
            case SPELL_ITEM_CALTROPS:
            {
                if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE) &&
                   !GetIsFlying(oTarget) &&
                    GetTimerEnded(ObjectToString(oTarget)))
                {
                    SetTimer(ObjectToString(oTarget), 5);

                    SignalSpellCastAt();

                    float fDelay = GetRandomDelay(0.5, 1.0);

                    DelayCommand(fDelay, ApplyDamageToObject(oTarget, 1, DAMAGE_TYPE_PIERCING));

                    // Intentional: OBJECT_SELF is the AOE itself, not the caster
                    int nDamageDone = GetLocalInt(OBJECT_SELF, CALTROPS_TOTAL_DAMAGE);
                    nDamageDone++;
                    SetLocalInt(OBJECT_SELF, CALTROPS_TOTAL_DAMAGE, nDamageDone);
                    if (nDamageDone >= 25)
                    {
                        DestroyObject(OBJECT_SELF);
                    }
                }
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

        switch(nSpellId)
        {
            case SPELL_ITEM_CALTROPS:
            {
                // Intentional: OBJECT_SELF is the AOE itself, not the caster
                int nDamageDone = GetLocalInt(OBJECT_SELF, CALTROPS_TOTAL_DAMAGE);

                json jArray = GetArrayOfAOETargets(SPELL_TARGET_STANDARDHOSTILE);
                int nIndex;
                for (nIndex = 0; nIndex < JsonGetLength(jArray) && nDamageDone < 25; nIndex++)
                {
                    oTarget = GetArrayObject(jArray, nIndex);

                    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE) &&
                       !GetIsFlying(oTarget) &&
                        GetTimerEnded(ObjectToString(oTarget)))
                    {
                        SetTimer(ObjectToString(oTarget), 5);

                        SignalSpellCastAt();

                        float fDelay = GetRandomDelay(0.5, 1.0);

                        DelayCommand(fDelay, ApplyDamageToObject(oTarget, 1, DAMAGE_TYPE_PIERCING));
                        nDamageDone++;
                        if (nDamageDone >= 25)
                        {
                            DestroyObject(OBJECT_SELF);
                        }
                    }
                }
                SetLocalInt(OBJECT_SELF, CALTROPS_TOTAL_DAMAGE, nDamageDone);
            }
            break;
        }
    }
    else
    {
        if (DoSpellHook()) return;

        // Validate the spell cast item
        if (!GetIsObjectValid(oCastItem))
        {
            if (DEBUG_LEVEL >= ERROR) Error("Item property spell being cast from a non-item: " + IntToString(nSpellId));
            return;
        }

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
            case SPELL_ITEM_CALTROPS:
            {
                eAOE = EffectAreaOfEffect(AOE_PER_CALTROPS, GetScriptName(), GetScriptName(), "");
            }
            break;
            default:
            {
                if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
                return;
            }
            break;
        }

        ApplyVisualEffectAtLocation(nVis, lTarget);
        if (fDuration > 0.0)
        {
            ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, fDuration);
        }
        else
        {
            ApplySpellEffectAtLocation(DURATION_TYPE_PERMANENT, eAOE, lTarget);
        }
    }
}

