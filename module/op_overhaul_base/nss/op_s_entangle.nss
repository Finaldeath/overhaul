//:://////////////////////////////////////////////
//:: Entangle
//:: op_s_entangle
//:://////////////////////////////////////////////
/*
    A mass of clinging vegetation wraps around all creatures in the area of
    effect. Those affected are entangled - immobilized to the spot, setting
    their dexerity to 3, and having -2 to attacks, though still able to fight
    and cast spells (although spells have a DC 15 concentration check to cast
    while entangled). Victims who make a Reflex save still have their movement
    reduced by half and can be affected by entangle in the next round if they
    do not leave the area.

    Also used for Vine Mine which just points to this script.
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
                !GetHasFeat(FEAT_WOODLAND_STRIDE, oTarget))
            {
                if (GetAffectedByIllusion(oTarget))
                {
                    ApplyAOEPersistentEffect(oTarget, EffectMovementSpeedDecrease(50));

                    if (GetTimerEnded(ObjectToString(oTarget)))
                    {
                        SetTimer(ObjectToString(oTarget), 5);

                        if (!DoResistSpell(oTarget, oCaster))
                        {
                            if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_ENTANGLE))
                            {
                                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC))
                                {
                                    effect eLink = EffectLinkEffects(IgnoreEffectImmunity(EffectEntangle()),
                                                                     EffectVisualEffect(VFX_DUR_ENTANGLE));
                                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, 6.0);
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

            SignalSpellCastAt();

            if (!GetIsIncorporeal(oTarget) &&
                !GetHasFeat(FEAT_WOODLAND_STRIDE, oTarget))
            {
                if (GetAffectedByIllusion(oTarget))
                {
                    ApplyAOEPersistentEffect(oTarget, EffectMovementSpeedDecrease(50));

                    if (GetTimerEnded(ObjectToString(oTarget)))
                    {
                        SetTimer(ObjectToString(oTarget), 5);

                        if (!DoResistSpell(oTarget, oCaster))
                        {
                            if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_ENTANGLE))
                            {
                                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC))
                                {
                                    effect eLink = EffectLinkEffects(IgnoreEffectImmunity(EffectEntangle()),
                                                                     EffectVisualEffect(VFX_DUR_ENTANGLE));
                                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, 6.0);
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

