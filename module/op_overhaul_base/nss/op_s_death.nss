//::///////////////////////////////////////////////
//:: Death Spells
//:: op_s_death
//:://////////////////////////////////////////////
/*
    Death spells. EffectDeath usage mainly.

    Finger of Death
    Save or Die, 3d6 + 1 / caster level damage if saved.

    Slay Living
    Touch Attack then Save or Die, 3d6 + 1 / caster level damage if saved.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Note we have a check for the immunity type, which defaults to DEATH_MAGIC.
    effect eDeath = IgnoreEffectImmunity(EffectDeath());

    // Save
    int nSavingThrow = SAVING_THROW_NONE, nSavingThrowType = SAVING_THROW_TYPE_NONE;
    // Immunity - Death Magic
    int nImmunity = IMMUNITY_TYPE_DEATH;
    // Touch attack?
    int nTouchType = TOUCH_NONE;

    // VFX
    int nImpact = VFX_NONE, nVis = VFX_NONE, nDamageVis = VFX_NONE;

    // Damage on save, don't set type and it won't use
    int nDiceNum, nDiceSize, nDamageBonus, nDamageType = -1;

    switch (nSpellId)
    {
        case SPELL_FINGER_OF_DEATH:
            nSavingThrow     = SAVING_THROW_FORT;
            nSavingThrowType = SAVING_THROW_TYPE_DEATH;
            nVis             = VFX_IMP_DEATH_L;
            nDamageVis       = VFX_IMP_NEGATIVE_ENERGY;
            nDiceNum         = 3;
            nDiceSize        = 6;
            nDamageBonus     = nCasterLevel;
            nDamageType      = DAMAGE_TYPE_NEGATIVE;
            break;
        case SPELL_SLAY_LIVING:
            nTouchType       = TOUCH_MELEE;
            nSavingThrow     = SAVING_THROW_FORT;
            nSavingThrowType = SAVING_THROW_TYPE_DEATH;
            nVis             = VFX_IMP_DEATH_L;
            nDamageVis       = VFX_IMP_NEGATIVE_ENERGY;
            nDiceNum         = 3;
            nDiceSize        = 6;
            nDamageBonus     = nCasterLevel;
            nDamageType      = DAMAGE_TYPE_NEGATIVE;
            break;
        default:
            Debug("[Sleep op_s_death] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
            break;
    }

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        int nTouch = DoTouchAttack(oTarget, oCaster, nTouchType);

        if (nTouch)
        {
            if (!DoResistSpell(oTarget, oCaster, fDelay))
            {
                if (!GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity))
                {
                    if (!DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType, fDelay))
                    {
                        DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget));
                    }
                    else if (nDamageType != -1)
                    {
                        int nDamage = GetDiceRoll(nDiceNum, nDiceSize, nDamageBonus);

                        if (nTouch == 2) nDamage *= 2;

                        DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, nDamageVis, nDamage, nDamageType));
                    }
                }
            }
        }
    }
}
