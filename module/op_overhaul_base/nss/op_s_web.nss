//::///////////////////////////////////////////////
//:: Web
//:: op_s_web
//:://////////////////////////////////////////////
/*
    Sticky strands cling to all creatures within the area of effect, entangling
    them. Creatures who make their save can move, but at a reduced rate
    dependent on their Strength (65% penalty minus 2% per strength ability score
    point).
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
                if (!GetHasFeat(FEAT_WOODLAND_STRIDE, oTarget) &&
                    !GetIsIncorporeal(oTarget) &&
                    !DoResistSpell(oTarget, oCaster))
                {
                    int nSlow = 65 - (GetAbilityScore(oTarget, ABILITY_STRENGTH) * 2);
                    if (nSlow <= 0)
                    {
                        nSlow = 1;
                    }
                    else if (nSlow > 99)
                    {
                        nSlow = 99;
                    }
                    ApplyAOEPersistentEffect(oTarget, EffectMovementSpeedDecrease(nSlow));

                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC))
                    {
                        effect eLink = EffectLinkEffects(EffectEntangle(),
                                                         EffectVisualEffect(VFX_DUR_WEB));
                        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, 6.0);
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

            if (GetTimerEnded(ObjectToString(oTarget)))
            {
                SetTimer(ObjectToString(oTarget), 5);

                SignalSpellCastAt();

                if (!GetHasFeat(FEAT_WOODLAND_STRIDE, oTarget) &&
                    !GetIsIncorporeal(oTarget) &&
                    !DoResistSpell(oTarget, oCaster))
                {
                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC))
                    {
                        effect eLink = EffectLinkEffects(EffectEntangle(),
                                                         EffectVisualEffect(VFX_DUR_WEB));
                        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, 6.0);
                    }
                }
            }
        }
    }
    else
    {
        if (DoSpellHook()) return;

        effect eAOE = EffectAreaOfEffect(AOE_PER_WEB, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel / 2, ROUNDS));
    }
}
