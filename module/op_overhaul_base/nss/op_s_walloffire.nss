//::///////////////////////////////////////////////
//:: Wall of Fire
//:: op_s_walloffire
//:://////////////////////////////////////////////
/*
    This spell creates a curtain of fire that deals 4d6 points of fire damage
    to any creature that attempts to pass through it.
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
                        AssignCommand(oCaster, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_FLAME_M, nDamage, DAMAGE_TYPE_FIRE));
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
                        AssignCommand(oCaster, DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_FLAME_M, nDamage, DAMAGE_TYPE_FIRE)));
                    }
                }
            }
        }
    }
    else
    {
        if (DoSpellHook()) return;

        ApplyVisualEffectAtLocation(VFX_FNF_GAS_EXPLOSION_FIRE, lTarget);

        effect eAOE = EffectAreaOfEffect(AOE_PER_WALLFIRE, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel, ROUNDS, TRUE, FALSE));
    }
}

