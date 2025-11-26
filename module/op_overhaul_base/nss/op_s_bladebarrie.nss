//:://////////////////////////////////////////////
//:: Blade Barrier
//:: op_s_bladebarrie
//:://////////////////////////////////////////////
/*
    Blade Barrier brings into being a 30-ft long and 3-ft wide wall of stabbing
    blades. All those passing through the wall take 1d6 points of damage per
    caster level.
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

                if (!DoResistSpell(oTarget, oCaster))
                {
                    int nDamageDice = min(20, nCasterLevel);
                    int nDamage = DoDamageSavingThrow(GetDiceRoll(6, nDamageDice), oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC);
                    ApplyDamageWithVFXToObject(oTarget, VFX_COM_BLOOD_LRG_RED, nDamage, DAMAGE_TYPE_SLASHING);
                }
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        // Nothing
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

                float fDelay = GetRandomDelay(0.1, 0.4);

                // 2d6 damage to everyone in the AOE
                if (!DoResistSpell(oTarget, oCaster))
                {
                    int nDamageDice = min(20, nCasterLevel);
                    int nDamage = DoDamageSavingThrow(GetDiceRoll(6, nDamageDice), oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay);

                    if (nDamage > 0)
                    {
                        AssignCommand(oCaster, DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, VFX_COM_BLOOD_LRG_RED, nDamage, DAMAGE_TYPE_SLASHING)));
                    }
                }
            }
        }
    }
    else
    {
        if (DoSpellHook()) return;

        effect eAOE = EffectAreaOfEffect(AOE_PER_WALLBLADE, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel / 2, ROUNDS));
    }
}
