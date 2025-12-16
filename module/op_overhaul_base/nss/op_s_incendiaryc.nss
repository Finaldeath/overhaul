//:://////////////////////////////////////////////
//:: Incendiary Cloud
//:: op_s_incendiaryc
//:://////////////////////////////////////////////
/*
    The caster creates a cloud of smoke and embers that causes 4d6 points of
    fire damage each round to all objects within the area of effect.

    This is also the Firebomb item spell as well.
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

            if (GetTimerEnded(ObjectToString(oTarget)))
            {
                SetTimer(ObjectToString(oTarget), 5);

                // 4d6 reflex adjusted damage to everyone in the AOE
                if (!DoResistSpell(oTarget, oCaster))
                {
                    int nDamage = DoDamageSavingThrow(GetDiceRoll(4, 6), oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_FIRE);

                    if (nDamage > 0)
                    {
                        AssignCommand(oCaster, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_FLAME_S, nDamage, DAMAGE_TYPE_FIRE));
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

        json jArray = GetArrayOfAOETargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_NONE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            if (GetTimerEnded(ObjectToString(oTarget)))
            {
                SetTimer(ObjectToString(oTarget), 5);
                SignalSpellCastAt();

                float fDelay = GetRandomDelay(0.5, 2.0);

                // 4d6 reflex adjusted damage to everyone in the AOE
                if (!DoResistSpell(oTarget, oCaster))
                {
                    int nDamage = DoDamageSavingThrow(GetDiceRoll(4, 6), oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_FIRE, fDelay);

                    if (nDamage > 0)
                    {
                        AssignCommand(oCaster, DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_FLAME_S, nDamage, DAMAGE_TYPE_FIRE)));
                    }
                }
            }
        }
    }
    else
    {
        if (DoSpellHook()) return;

        float fDuration = GetDuration(nCasterLevel, ROUNDS, TRUE, FALSE);


        // Acid bomb does 5 turn duration AOE, plus impact damage.
        if (nSpellId == SPELL_ITEM_FIREBOMB)
        {
            fDuration = GetDuration(5, ROUNDS);

            // 10d6 fire damage to the direct target
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

                DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_FLAME_M, oTarget));
                DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_FIRE));
            }
            // To help with the persistent AOE slow, we set the spell Id to Incendiary Cloud even if it's Fire Bomb.
            nSpellId = SPELL_INCENDIARY_CLOUD;
        }

        ApplyVisualEffectAtLocation(VFX_FNF_GAS_EXPLOSION_FIRE, lTarget);

        effect eAOE = EffectAreaOfEffect(AOE_PER_FOGFIRE, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, fDuration);
    }
}

