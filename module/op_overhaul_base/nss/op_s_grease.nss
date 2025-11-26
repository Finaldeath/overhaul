//:://////////////////////////////////////////////
//:: Grease
//:: op_s_grease
//:://////////////////////////////////////////////
/*
    A churning field of oil and grease fills the target area, causing all within
    to either fall down or move at a reduced speed.  Those entering the area
    who walk on the grease are slowed by 50% (no spell resistance applies).
    Those in the grease then must make a reflex save every round or be knocked
    down for 4 seconds.
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

            if (!GetHasFeat(FEAT_WOODLAND_STRIDE, oTarget) &&
                !GetIsIncorporeal(oTarget) &&
                !DoResistSpell(oTarget, oCaster, 0.0, FALSE, TRUE, FALSE))
            {
                ApplyAOEPersistentEffect(oTarget, EffectMovementSpeedDecrease(50));

                if (GetTimerEnded(ObjectToString(oTarget)))
                {
                    SetTimer(ObjectToString(oTarget), 5);

                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC))
                    {
                        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), oTarget, 4.0);
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

            if (!GetHasFeat(FEAT_WOODLAND_STRIDE, oTarget) &&
                !GetIsIncorporeal(oTarget))
            {
                if (GetTimerEnded(ObjectToString(oTarget)))
                {
                    SetTimer(ObjectToString(oTarget), 5);
                    SignalSpellCastAt();

                    float fDelay = GetRandomDelay(0.4, 1.2);

                    if (!DoResistSpell(oTarget, oCaster, fDelay, FALSE, TRUE, FALSE))
                    {
                        if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay))
                        {
                            AssignCommand(oCaster, DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), oTarget, 4.0)));
                        }
                    }
                }
            }
        }
    }
    else
    {
        if (DoSpellHook()) return;

        ApplyVisualEffectAtLocation(VFX_FNF_GAS_EXPLOSION_GREASE, lTarget);

        effect eAOE = EffectAreaOfEffect(AOE_PER_GREASE, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(2 + (nCasterLevel / 3), ROUNDS, TRUE, FALSE));
    }
}
