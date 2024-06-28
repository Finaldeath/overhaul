//::///////////////////////////////////////////////
//:: Explosions
//:: op_s_explosions
//:://////////////////////////////////////////////
/*
    Explosion spells! Standardising reflex-based explosion spells.

    2da holds the AOE information and we can plumb in the rest in a switch
    statement.

    Fireball
    1d6 points of fire damage per caster level, to a maximum of 10d6.
    Scientilating Sphere
    As Fireball but Electrical damage and save.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nDiceNum, nDiceSize, nDamageType, nSavingThrow = -1, nSavingThrowType = SAVING_THROW_TYPE_NONE;
    effect eImpact, eVis;

    switch (nSpellId)
    {
        case SPELL_FIREBALL:
        {
            nDiceNum = max(10, nCasterLevel);
            nDiceSize = 6;
            nDamageType = DAMAGE_TYPE_FIRE;
            nSavingThrow = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
            eImpact = EffectVisualEffect(VFX_FNF_FIREBALL);
            eVis = EffectVisualEffect(VFX_IMP_FLAME_M);
        }
        break;
        case SPELL_SCINTILLATING_SPHERE:
        {
            nDiceNum = max(10, nCasterLevel);
            nDiceSize = 6;
            nDamageType = DAMAGE_TYPE_ELECTRICAL;
            nSavingThrow = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ELECTRICITY;
            eImpact = EffectVisualEffect(VFX_FNF_ELECTRIC_EXPLOSION);
            eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
        }
        break;
    }

    ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, lTarget);

    json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget)/20.0;

        if (!DoResistSpell(oTarget, oCaster, fDelay))
        {
            // Roll damage
            int nDamage = GetDiceRoll(nDiceNum, nDiceSize);

            // Damage modification based on save (half, with Reflex allowing feats to reduce further)
            if (nSavingThrow != -1)
            {
                nDamage = DoDamageSavingThrow(nDamage, oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType, fDelay);
            }

            if (nDamage > 0)
            {
                effect eDamage = EffectDamage(nDamage, nDamageType);

                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
            }
        }
    }
}

