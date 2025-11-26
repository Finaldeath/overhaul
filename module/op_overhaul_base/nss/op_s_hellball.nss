//:://////////////////////////////////////////////
//:: Hellball
//:: op_s_hellball
//:://////////////////////////////////////////////
/*
    Specifics: The caster creates a ball of energy that does 10d6 points of
    acid, fire, electrical and sonic damage to all targets in its blast radius.
    They are also knocked prone for 1 round.
    Save: Reflex for half damage but no save for the knockdown. Hellball
    additionally ignores Evasion and Improved Evasion.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    ApplyVisualEffectAtLocation(VFX_FNF_HELLBALL, lTarget);

    json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        // Saving throw
        int nSavingThrow = DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay);

        // Apply the knockdown
        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), oTarget, 6.0);

        // Do each damage type
        int nDamage = GetDiceRoll(10, 6);
        if (nSavingThrow != FALSE) nDamage /= 2;
        ApplyDamageWithVFXToObject(oTarget, VFX_IMP_FLAME_M, nDamage, DAMAGE_TYPE_FIRE);
        nDamage = GetDiceRoll(10, 6);
        if (nSavingThrow != FALSE) nDamage /= 2;
        ApplyDamageWithVFXToObject(oTarget, VFX_IMP_ACID_L, nDamage, DAMAGE_TYPE_ACID);
        nDamage = GetDiceRoll(10, 6);
        if (nSavingThrow != FALSE) nDamage /= 2;
        ApplyDamageWithVFXToObject(oTarget, VFX_IMP_SONIC, nDamage, DAMAGE_TYPE_SONIC);
        nDamage = GetDiceRoll(10, 6);
        if (nSavingThrow != FALSE) nDamage /= 2;
        ApplyDamageWithVFXToObject(oTarget, VFX_IMP_LIGHTNING_M, nDamage, DAMAGE_TYPE_ELECTRICAL);
    }
}

