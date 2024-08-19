//::///////////////////////////////////////////////
//:: Acid Fog
//:: op_s_acidfog.nss
//:://////////////////////////////////////////////
/*
    Acid Fog creates a thick, clinging, greenish cloud. Creatures entering the
    cloud have their movement reduced by 50% and take 2d6 acid damage.

    Every round a creature spends in the cloud, it suffers 2d6 acid damage.

    Note: Currently the movement speed decrease stacks with more than one AOE,
    so we might sort this out later, possibly with EffectRunScript.
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

            if (GetAffectedByIllusion(oTarget))
            {
                ApplyAOEPersistentEffect(oTarget, EffectMovementSpeedDecrease(50));
            }

            if (GetTimerEnded(ObjectToString(oTarget)))
            {
                SetTimer(ObjectToString(oTarget), 5);

                if (!DoResistSpell(oTarget, oCaster))
                {
                    ApplyDamageWithVFXToObject(oTarget, VFX_IMP_ACID_S, GetDiceRoll(2, 6), DAMAGE_TYPE_ACID);
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

                float fDelay = GetRandomDelay(0.4, 1.2);

                // 2d6 damage to everyone in the AOE
                if (!DoResistSpell(oTarget, oCaster))
                {
                    AssignCommand(oCaster, DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_ACID_S, GetDiceRoll(2, 6), DAMAGE_TYPE_ACID)));
                }
            }
        }
    }
    else
    {
        if (DoSpellHook()) return;

        ApplyVisualEffectAtLocation(VFX_FNF_GAS_EXPLOSION_ACID, lTarget);

        effect eAOE = EffectAreaOfEffect(AOE_PER_FOGACID, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel / 2, ROUNDS));
    }
}
