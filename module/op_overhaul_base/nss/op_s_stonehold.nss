//::///////////////////////////////////////////////
//:: Stonehold
//:: op_s_stonehold
//:://////////////////////////////////////////////
/*
    Creates a cloud that paralyzes any creatures inside of it, encasing them in
    stone for 1 round.
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

        if (GetTimerEnded(ObjectToString(oTarget)))
        {
            SetTimer(ObjectToString(oTarget), 5);

            if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
            {
                SignalSpellCastAt();
                if (!DoResistSpell(oTarget, oCaster))
                {
                    if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_PARALYSIS))
                    {
                        if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_PARALYSIS))
                        {
                            effect eLink = EffectLinkEffects(IgnoreEffectImmunity(EffectParalyze()),
                                                             EffectVisualEffect(VFX_DUR_STONEHOLD));
                            ApplyAOEPersistentEffect(oTarget, eLink);
                        }
                    }
                }
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        // Remove all remaining Stonehold effects
        RemovePersistentAOEEffects(oTarget);
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;

        json jArray = GetArrayOfAOETargets(SPELL_TARGET_STANDARDHOSTILE);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            if (GetTimerEnded(ObjectToString(oTarget)))
            {
                SetTimer(ObjectToString(oTarget), 5);

                SignalSpellCastAt();

                if (!GetHasEffect(oTarget, EFFECT_TYPE_ALL, nSpellId, "AOEEFFECT"))
                {
                    if (!DoResistSpell(oTarget, oCaster))
                    {
                        if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_PARALYSIS))
                        {
                            if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_PARALYSIS))
                            {
                                effect eLink = EffectLinkEffects(IgnoreEffectImmunity(EffectParalyze()),
                                                                 EffectVisualEffect(VFX_DUR_STONEHOLD));
                                ApplyAOEPersistentEffect(oTarget, eLink);
                            }
                        }
                    }
                }
            }
        }
    }
    else
    {
        if (DoSpellHook()) return;

        effect eAOE = EffectAreaOfEffect(AOE_PER_STONEHOLD, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel, ROUNDS, TRUE, FALSE));
    }
}
