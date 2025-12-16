//:://////////////////////////////////////////////
//:: Acid Fog
//:: op_s_acidfog
//:://////////////////////////////////////////////
/*
    Acid Fog creates a thick, clinging, greenish cloud. Creatures entering the
    cloud have their movement reduced by 50% and take 2d6 acid damage.

    Every round a creature spends in the cloud, it suffers 2d6 acid damage.

    This also is Acid Bomb, since that's how Bioware did it.
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

        float fDuration = GetDuration(nCasterLevel / 2, ROUNDS);

        // Acid bomb does 5 turn duration AOE, plus impact damage.
        if (nSpellId == SPELL_ITEM_ACIDBOMB)
        {
            fDuration = GetDuration(5, ROUNDS);

            // 10d6 acid damage to the direct target
            int nTargetDamage = 0;
            object oMainTarget = oTarget;
            if (GetIsObjectValid(oTarget))
            {
                if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
                {
                    int nTouch = DoTouchAttack(oTarget, oCaster, TOUCH_RANGED);
                    if (nTouch)
                    {
                        nTargetDamage = d6(10);
                        if (nTouch == TOUCH_RESULT_CRITICAL_HIT) nTargetDamage *= 2;
                    }
                }
            }

            // AOE grenade for 1 damage
            json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE | OBJECT_TYPE_DOOR);
            int nIndex;
            for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
            {
                oTarget = GetArrayObject(jArray, nIndex);

                SignalSpellCastAt();

                float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget)) / 20.0;

                int nDamage = 1;

                if (oTarget == oMainTarget) nDamage += nTargetDamage;

                DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_ACID_L, oTarget));
                DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_ACID));
            }
            // To help with the persistent AOE slow, we set the spell Id to Acid Fog even if it's Acid Bomb.
            nSpellId = SPELL_ACID_FOG;
        }

        ApplyVisualEffectAtLocation(VFX_FNF_GAS_EXPLOSION_ACID, lTarget);

        effect eAOE = EffectAreaOfEffect(AOE_PER_FOGACID, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, fDuration);
    }
}
