//::///////////////////////////////////////////////
//:: Melf's Acid Arrow Run Script
//:: op_s_melfsacidrs.nss
//:://////////////////////////////////////////////
/*
    The caster targets a single creature with an acid bolt. If a ranged touch
    attack is successful the bolt hits and damages the target with 2d4 acid
    damage. Then for every additional round (up to 7 at caster level 18) 2d4
    acid damage is applied unless somehow neutralized.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Only interval matters
    if (GetLastRunScriptEffectScriptType() == RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_INTERVAL)
    {
        int nDamage = GetDiceRoll(2, 4);
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_ACID_S), oTarget);
        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_ACID), oTarget);
    }
}

