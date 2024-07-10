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

void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (!AOECheck()) return;

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            // Persistent damage
            ApplyAOEPersistentRunScriptEffect(oTarget);

            if (!DoResistSpell(oTarget, oCaster))
            {
                // Always apply decreased movement
                ApplyAOEPersistentEffect(oTarget, EffectMovementSpeedDecrease(50));

                ApplyVisualEffectToObject(VFX_IMP_ACID_S, oTarget);
                ApplyDamageToObject(oTarget, GetDiceRoll(2, 6), DAMAGE_TYPE_ACID);
            }
        }
        return;
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        // Remove all tagged effects with our OID in it as set above
        RemoveEffectsFromSpell(oTarget, nSpellId, EFFECT_TYPE_ALL, ObjectToString(OBJECT_SELF));
    }
    else if (GetLastRunScriptEffectScriptType() == RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_INTERVAL)
    {
        if (!AOECheck()) return;

        // 2d6 damage to everyone in the AOE
        if (!DoResistSpell(oTarget, oCaster))
        {
            ApplyVisualEffectToObject(VFX_IMP_ACID_S, oTarget);
            ApplyDamageToObject(oTarget, GetDiceRoll(2, 6), DAMAGE_TYPE_ACID);
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        AOECheck();
    }
    else
    {
        if (DoSpellHook()) return;

        ApplyVisualEffectAtLocation(VFX_FNF_GAS_EXPLOSION_ACID, lTarget);

        effect eAOE = EffectAreaOfEffect(AOE_PER_FOGACID, "op_s_acidfog", "op_s_acidfog", "op_s_acidfog");
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel/2, ROUNDS));
    }
}

