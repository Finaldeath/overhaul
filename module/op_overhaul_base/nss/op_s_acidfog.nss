//::///////////////////////////////////////////////
//:: Acid Fog
//:: op_s_acidfog.nss
//:://////////////////////////////////////////////
/*
    Acid Fog creates a thick, clinging, greenish cloud. Creatures entering the
    cloud take 4d6 acid damage. Creatures inside the cloud must make a Fortitude
    save or have their movement reduced by 50%. Every round a creature spends
    in the cloud, it suffers 2d6 acid damage.

    Note: Currently the movement speed decrease (if applied) stacks, we might
    sort this out later, possibly with EffectRunScript.
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
            if (!DoResistSpell(oTarget, oCaster))
            {
                int nDamage;
                // Half damage on save and no slow
                if (DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_ACID))
                {
                    nDamage = GetDiceRoll(4, 6) / 2;
                }
                else
                {
                    nDamage = GetDiceRoll(4, 6);
                    effect eSlow = TagEffect(EffectMovementSpeedDecrease(50), "AOE" + ObjectToString(OBJECT_SELF));
                    ApplySpellEffectToObject(DURATION_TYPE_PERMANENT, eSlow, oTarget);
                }
                ApplyVisualEffectToObject(VFX_IMP_ACID_S, oTarget);
                ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_ACID);
            }
        }
        return;
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        // Remove all tagged effects with our OID in it as set above
        RemoveEffectsFromSpell(oTarget, nSpellId, EFFECT_TYPE_ALL, "AOE" + ObjectToString(OBJECT_SELF));

        return;
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;

        // 2d6 damage to everyone in the AOE, fortitude for half
        oTarget = GetFirstInPersistentObject();
        while (GetIsObjectValid(oTarget))
        {
            if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
            {
                float fDelay = GetRandomDelay(0.4, 1.2);
                if (!DoResistSpell(oTarget, oCaster, fDelay))
                {
                    // Half damage on save
                    int nDamage = DoDamageSavingThrow(GetDiceRoll(2, 6), oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_ACID, fDelay);

                    if (nDamage > 0)
                    {
                        DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_ACID_S, oTarget));
                        DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_ACID));
                    }
                }
            }
            oTarget = GetNextInPersistentObject();
        }
        return;
    }

    if (DoSpellHook()) return;

    ApplyVisualEffectAtLocation(VFX_FNF_GAS_EXPLOSION_ACID, lTarget);

    effect eAOE = EffectAreaOfEffect(AOE_PER_FOGACID, "op_s_acidfog", "op_s_acidfog", "op_s_acidfog");
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel/2, ROUNDS));
}

