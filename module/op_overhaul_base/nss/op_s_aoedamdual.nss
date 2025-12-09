//:://////////////////////////////////////////////
//:: AOE Spells: Damage with Dual Damage
//:: op_s_aoedamdual
//:://////////////////////////////////////////////
/*
    Flame Strike, Fire Storme etc.

    Flame Strike
    A pillar of flame engulfs all within the area of effect, inflicting 1d6
    points of damage per caster level (to a maximum of 15d6). Half of the damage
    caused by the spell is divine and the other half is fire-based.

    Fire Storm
    All enemies within this spell's area of effect are inundated with a rain of
    fire and take 1d6 points of damage per caster level (to a maximum of 20d6).
    Half of the damage is divine and the other half is fire-based.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nDiceNum, nDiceSize, nSavingThrow = -1, nSavingThrowType = SAVING_THROW_TYPE_NONE;
    int nDamageType1, nDamageType2;
    // Toggles
    int nImpact = VFX_INVALID, nVis = VFX_INVALID;
    // Can change to selective hostile
    int nTargetType = SPELL_TARGET_STANDARDHOSTILE;

    switch (nSpellId)
    {
        case SPELL_FLAME_STRIKE:
        {
            nDiceNum         = max(15, nCasterLevel);
            nDiceSize        = 6;
            nDamageType1     = DAMAGE_TYPE_FIRE;
            nDamageType2     = DAMAGE_TYPE_DIVINE;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
            nImpact          = VFX_IMP_DIVINE_STRIKE_FIRE;
            nVis             = VFX_IMP_FLAME_S;
        }
        break;
        case SPELL_FIRE_STORM:
        {
            nTargetType      = SPELL_TARGET_SELECTIVEHOSTILE;
            nDiceNum         = max(20, nCasterLevel);
            nDiceSize        = 6;
            nDamageType1     = DAMAGE_TYPE_FIRE;
            nDamageType2     = DAMAGE_TYPE_DIVINE;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
            nImpact          = VFX_FNF_FIRESTORM;
            nVis             = VFX_IMP_FLAME_M;
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay;
        switch (nSpellId)
        {
            case SPELL_FLAME_STRIKE:
            {
                // Flame Strike static delay + bit more
                fDelay = 0.3 + GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;
            }
            break;
            case SPELL_FIRE_STORM:
            {
                // Inverse time since the fire storm comes in closer. Nearer is closer to 2 seconds, further is less. Matches VFX.
                fDelay = 2.0 - GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 10.0;
            }
            break;
        }

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
                if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));

                // We half the damage
                int nHalfdamage = nDamage/2;

                // To keep the remainder, we do half with 2nd damage type, and 1st gets the bonus point if needed
                DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage - nHalfdamage, nDamageType1));
                DelayCommand(fDelay, ApplyDamageToObject(oTarget, nHalfdamage, nDamageType2));
            }
        }
    }
}

