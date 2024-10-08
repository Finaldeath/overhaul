//::///////////////////////////////////////////////
//:: Spike Growth
//:: op_s_spikegrowth
//:://////////////////////////////////////////////
/*
    Covers the terrain with small spikes. Any creature with legs will suffer 1d4
    points of nonmagical piercing damage each round that they remain within the
    afflicted area. On a failed Reflex save these spikes can damage the victim's
    legs so that even once they are free of the spike growth, their movement
    rate is slowed by 30% for a day.

    The movement speed decrease can be cured by any Cure or Heal spell as well
    as usual means.
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

            if (!GetIsIncorporeal(oTarget) &&
                 GetHasLegs(oTarget) &&
                !GetHasFeat(FEAT_WOODLAND_STRIDE, oTarget))
            {
                if (GetAffectedByIllusion(oTarget))
                {
                    if (GetTimerEnded(ObjectToString(oTarget)))
                    {
                        SetTimer(ObjectToString(oTarget), 5);

                        if (!DoResistSpell(oTarget, oCaster))
                        {
                            ApplyDamageToObject(oTarget, GetDiceRoll(1, 4), DAMAGE_TYPE_PIERCING);

                            if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC))
                            {
                                if (!GetHasSpellEffect(nSpellId, oTarget))
                                {
                                    effect eLink = EffectLinkEffects(EffectMovementSpeedDecrease(30),
                                                                     EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
                                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, HoursToSeconds(24));
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        // Nothing to do
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;

        json jArray = GetArrayOfAOETargets(SPELL_TARGET_STANDARDHOSTILE);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt();

            if (!GetIsIncorporeal(oTarget) &&
                 GetHasLegs(oTarget) &&
                !GetHasFeat(FEAT_WOODLAND_STRIDE, oTarget))
            {
                if (GetAffectedByIllusion(oTarget))
                {
                    if (GetTimerEnded(ObjectToString(oTarget)))
                    {
                        SetTimer(ObjectToString(oTarget), 5);

                        if (!DoResistSpell(oTarget, oCaster))
                        {
                            ApplyDamageToObject(oTarget, GetDiceRoll(1, 4), DAMAGE_TYPE_PIERCING);

                            if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC))
                            {
                                if (!GetHasSpellEffect(nSpellId, oTarget))
                                {
                                    effect eLink = EffectLinkEffects(EffectMovementSpeedDecrease(30),
                                                                     EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
                                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, HoursToSeconds(24));
                                }
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

        effect eAOE = EffectAreaOfEffect(AOE_PER_ENTANGLE, GetScriptName(), GetScriptName(), GetScriptName());

        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(3 + (nCasterLevel/2), ROUNDS));
    }
}

