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

    Phantasmal Killer
    The caster conjures an image of utmost horror to strike down a single
    creature. The target may attempt a Will save vs. Fear to disbelieve the
    spell, avoiding all ill effects. Failing that, the target then makes a
    Fortitude save vs. Fear to avoid instant death. A successful save still
    inflicts 3d6 points of magic damage.

    Weird
    A horrible phantasm rises to stand before enemy creatures in the area of
    effect, causing them to make a Will save vs. Fear. If they fail, the
    phantasm touches them and they must now make a Fortitude saving throw vs.
    Fear. If this saving throw fails, the creature dies. Those who succeed
    the Fortitude save still take 3d6 points of damage, are stunned for 1
    round and take 1d4 strength damage for 10 minutes. Creatures with less
    than 4 HD automatically die, without any saving throws.

    Destruction
    The target creature must make a Fortitude save or die. A successful save
    still results in the target taking 10d6 points of divine damage.
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
    int nSavingThrow2 = SAVING_THROW_NONE, nSavingThrowType2 = SAVING_THROW_TYPE_NONE;
    // Immunity - Death Magic
    int nImmunity = IMMUNITY_TYPE_DEATH;
    // Touch attack?
    int nTouchType = TOUCH_NONE;

    // VFX
    int nImpact = VFX_NONE, nVis = VFX_NONE, nDamageVis = VFX_NONE;

    // Damage on save, don't set type and it won't use
    int nDiceNum, nDiceSize, nDamageBonus, nDamageType = -1;

    // Weird gets more fail effects and HD 4 kills.
    int bWeird = FALSE;

    // TargetType
    int nTargetType = SPELL_TARGET_STANDARDHOSTILE;

    switch (nSpellId)
    {
        case SPELL_FINGER_OF_DEATH:
        {
            nSavingThrow     = SAVING_THROW_FORT;
            nSavingThrowType = SAVING_THROW_TYPE_DEATH;
            nVis             = VFX_IMP_DEATH_L;
            nDamageVis       = VFX_IMP_NEGATIVE_ENERGY;
            nDiceNum         = 3;
            nDiceSize        = 6;
            nDamageBonus     = nCasterLevel;
            nDamageType      = DAMAGE_TYPE_NEGATIVE;
        }
        break;
        case SPELL_SLAY_LIVING:
        {
            nTouchType       = TOUCH_MELEE;
            nSavingThrow     = SAVING_THROW_FORT;
            nSavingThrowType = SAVING_THROW_TYPE_DEATH;
            nVis             = VFX_IMP_DEATH_L;
            nDamageVis       = VFX_IMP_NEGATIVE_ENERGY;
            nDiceNum         = 3;
            nDiceSize        = 6;
            nDamageBonus     = nCasterLevel;
            nDamageType      = DAMAGE_TYPE_NEGATIVE;
        }
        break;
        case SPELL_PHANTASMAL_KILLER:
        {
            nSavingThrow      = SAVING_THROW_WILL;
            nSavingThrowType  = SAVING_THROW_TYPE_FEAR;
            nSavingThrow2     = SAVING_THROW_FORT;
            nSavingThrowType2 = SAVING_THROW_TYPE_FEAR;
            nImmunity         = IMMUNITY_TYPE_FEAR;
            nVis              = VFX_IMP_DEATH;
            nDamageVis        = VFX_IMP_SONIC;
            nDiceNum          = 3;
            nDiceSize         = 6;
            nDamageType       = DAMAGE_TYPE_MAGICAL;
        }
        break;
        case SPELL_WEIRD:
        {
            bWeird            = TRUE;
            nTargetType       = SPELL_TARGET_SELECTIVEHOSTILE;
            nImpact           = VFX_FNF_WEIRD;
            nSavingThrow      = SAVING_THROW_WILL;
            nSavingThrowType  = SAVING_THROW_TYPE_FEAR;
            nSavingThrow2     = SAVING_THROW_FORT;
            nSavingThrowType2 = SAVING_THROW_TYPE_FEAR;
            nImmunity         = IMMUNITY_TYPE_FEAR;
            nVis              = VFX_IMP_DEATH;
            nDamageVis        = VFX_IMP_SONIC;
            nDiceNum          = 3;
            nDiceSize         = 6;
            nDamageType       = DAMAGE_TYPE_MAGICAL;
        }
        break;
        case SPELL_DESTRUCTION:
        {
            // Spectacular death due to the explody VFX
            eDeath = IgnoreEffectImmunity(EffectDeath(TRUE));
            nSavingThrow     = SAVING_THROW_FORT;
            nSavingThrowType = SAVING_THROW_TYPE_DEATH;
            nVis             = VFX_IMP_DESTRUCTION;
            nDamageVis       = VFX_IMP_DESTRUCTION;
            nDiceNum         = 10;
            nDiceSize        = 6;
            nDamageType      = DAMAGE_TYPE_DIVINE;
        }
        break;
        default:
            Debug("[op_s_death] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
            break;
    }

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(nTargetType);
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
                    // If weird we do 4HD check
                    if (bWeird)
                    {
                        if (GetHitDice(oTarget) < 4)
                        {
                            DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget));
                            continue;
                        }
                    }
                    // If 1 saving throw we do it or damage. If 2 saving throws the first one makes us immune to all the effects.
                    int bAdditionalEffect = FALSE;
                    if (!DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType, fDelay))
                    {
                        if (nSavingThrow2 == SAVING_THROW_NONE || !DoSavingThrow(oTarget, oCaster, nSavingThrow2, nSpellSaveDC, nSavingThrowType2, fDelay))
                        {
                            DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget));
                        }
                        else if (nSavingThrow2 != SAVING_THROW_NONE)
                        {
                            bAdditionalEffect = TRUE;
                        }
                    }
                    else if (nSavingThrow2 == SAVING_THROW_NONE)
                    {
                        bAdditionalEffect = TRUE;
                    }


                    if (bAdditionalEffect)
                    {
                        if (nDamageType != -1)
                        {
                            int nDamage = GetDiceRoll(nDiceNum, nDiceSize, nDamageBonus);

                            if (nTouch == TOUCH_RESULT_CRITICAL_HIT) nDamage *= 2;

                            DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, nDamageVis, nDamage, nDamageType));
                        }
                        if (bWeird)
                        {
                            effect eStun = EffectLinkEffects(EffectStunned(), EffectVisualEffect(VFX_IMP_STUN));
                            effect eAbilityDecrease = EffectLinkEffects(EffectAbilityDecrease(ABILITY_STRENGTH, GetDiceRoll(1, 4)), EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));

                            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eStun, oTarget, GetDuration(1, ROUNDS, FALSE)));
                            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eAbilityDecrease, oTarget, GetDuration(10, MINUTES, FALSE)));
                        }
                    }
                }
            }
        }
    }
}

