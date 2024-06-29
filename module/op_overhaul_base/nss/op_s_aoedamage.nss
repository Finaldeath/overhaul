//::///////////////////////////////////////////////
//:: AOE Damage Spells
//:: op_s_aoedamage
//:://////////////////////////////////////////////
/*
    Generally reflex-based damage only spells and spell abilties.

    2da holds the AOE information and we can plumb in the rest in a switch
    statement.

    Fireball
    1d6 points of fire damage per caster level, to a maximum of 10d6.

    Scientilating Sphere
    As Fireball but Electrical damage and save.

    Cone of Cold
    Cone for 1d6 cold damage, max 15d6.

    Mestil's Acid Breath
    Cone for 1d6 acid damage, max 10d6.

    Call Lightning
    All enemies within the area of effect take 1d6 points of electrical
    damage per caster level, to a maximum of 10d6.

    Burning Hands
    1d4 fire damage per level, maximum 5d4.
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
    // Toggles
    int bImpact = FALSE, bDelayRandom = FALSE;
    // Can change to selective hostile
    int nTargetType = SPELL_TARGET_STANDARDHOSTILE;
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
            bImpact = TRUE;
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
            bImpact = TRUE;
            eImpact = EffectVisualEffect(VFX_FNF_ELECTRIC_EXPLOSION);
            eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
        }
        break;
        case SPELL_CONE_OF_COLD:
        {
            nDiceNum = max(15, nCasterLevel);
            nDiceSize = 6;
            nDamageType = DAMAGE_TYPE_COLD;
            nSavingThrow = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_COLD;
            eVis = EffectVisualEffect(VFX_IMP_FROST_L);
        }
        break;
        case SPELL_MESTILS_ACID_BREATH:
        {
            nDiceNum = max(10, nCasterLevel);
            nDiceSize = 6;
            nDamageType = DAMAGE_TYPE_ACID;
            nSavingThrow = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ACID;
            eVis = EffectVisualEffect(VFX_IMP_ACID_L);
        }
        break;
        case SPELL_CALL_LIGHTNING:
        {
            nTargetType = SPELL_TARGET_SELECTIVEHOSTILE;
            bDelayRandom = TRUE;

            nDiceNum = max(10, nCasterLevel);
            nDiceSize = 6;
            nDamageType = DAMAGE_TYPE_ELECTRICAL;
            nSavingThrow = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ELECTRICITY;
            eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
        }
        break;
        case SPELL_BURNING_HANDS:
        {
            nDiceNum = max(5, nCasterLevel);
            nDiceSize = 4;
            nDamageType = DAMAGE_TYPE_FIRE;
            nSavingThrow = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
            eVis = EffectVisualEffect(VFX_IMP_FLAME_S);
        }
        break;
        default:
            OP_Debug("[op_s_aoedamage] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        break;
    }

    ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, lTarget);

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = bDelayRandom ? GetRandomDelay(0.4, 1.75) : GetDistanceBetweenLocations(GetLocation(oTarget), lTarget)/20.0;

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

