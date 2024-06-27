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
                effect eVis = EffectVisualEffect(VFX_IMP_ACID_S);
                effect eDam = EffectDamage(nDamage, DAMAGE_TYPE_ACID);
                ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
                ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
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

        effect eVis = EffectVisualEffect(VFX_IMP_ACID_S);

        // 2d6 damage to everyone in the AOE, fortitude for half
        oTarget = GetFirstInPersistentObject();
        while (GetIsObjectValid(oTarget))
        {
            if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
            {
                float fDelay = GetRandomDelay(0.4, 1.2);
                if (!DoResistSpell(oTarget, oCaster, fDelay))
                {
                    int nDamage = GetDiceRoll(2, 6);
                    // Half damage on save
                    if (DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_ACID, fDelay))
                    {
                        nDamage /= 2;
                    }
                    effect eDam = EffectDamage(nDamage, DAMAGE_TYPE_ACID);
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                }
            }
            oTarget = GetNextInPersistentObject();
        }
        return;
    }

    if (DoSpellHook()) return;

    effect eImpact = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_ACID);
    effect eAOE = EffectAreaOfEffect(AOE_PER_FOGACID, "op_s_acidfog", "op_s_acidfog", "op_s_acidfog");

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, lTarget);
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel/2, ROUNDS));
}

