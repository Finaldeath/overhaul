//::///////////////////////////////////////////////
//:: Negative Spells
//:: op_s_negative
//:://////////////////////////////////////////////
/*
    Negative Energy Burst
    All creatures caught in the area of effect take 1d8 points of negative
    energy damage, +1 per caster level, to a maximum of +20. All creatures
    caught in the area also lose 1 point of strength per 4 caster levels unless
    they succeeded on their Will saving throw. Negative energy spells have a
    reverse effect on undead, healing instead of harming them and improving
    their strength.

    Negative Energy Ray
    On a successful ranged touch attack a ray of negative energy slams into the
    target creature, doing 1d6 points of negative damage. After level 1, the
    spell does an additional 1d6 points of damage for every 2 caster levels, to
    a maximum of 5d6 at level 9. Negative energy spells have a reverse effect
    on undead, healing instead of harming them, and they will automatically hit.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nDiceNum, nDiceSize, nExtraDam = 0;
    int nDamageType = DAMAGE_TYPE_NEGATIVE;
    int nStrength = 0;
    int nTouchType = TOUCH_NONE;
    int nImpact = VFX_NONE, nBeam = VFX_NONE, nVis = VFX_IMP_NEGATIVE_ENERGY, nHealVis = VFX_IMP_HEALING_M;

    switch (nSpellId)
    {
        case SPELL_NEGATIVE_ENERGY_BURST:
        {
            nDiceNum = 1;
            nDiceSize = 8;
            nExtraDam = min(20, nCasterLevel);
            nStrength = max(1, nCasterLevel/4);
            nImpact = VFX_FNF_LOS_EVIL_20;
        }
        break;
        case SPELL_NEGATIVE_ENERGY_RAY:
        {
            nDiceNum = min(5, (nCasterLevel + 1) / 2);
            nDiceSize = 6;
            nTouchType = TOUCH_RANGED;
            nBeam = VFX_BEAM_EVIL;
        }
        break;
        default:
        {
            Debug("[op_s_negative] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(SPELL_TARGET_ANYTHING, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget)/25.0;

        int nTouch = DoTouchAttack(oTarget, oCaster, nTouchType);

        if (nBeam != VFX_NONE) ApplyBeamToObject(nBeam, oTarget, (nTouch == FALSE));

        // If undead we heal
        if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
        {
            SignalSpellCastAt(oTarget, oCaster, FALSE);

            // Don't care if allied or enemy do healing
            if (nTouch)
            {
                effect eHeal = EffectHeal(GetDiceRoll(nDiceNum, nDiceSize, nExtraDam));

                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget));

                if (nStrength > 0)
                {
                    effect eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_STRENGTH, nStrength),
                                                     EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_PERMANENT, eLink, oTarget));
                }
            }
        }
        // If not undead we damage etc. if right hostility
        else if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            SignalSpellCastAt(oTarget, oCaster, TRUE);

            if (nTouch)
            {
                if (!DoResistSpell(oTarget, oCaster, fDelay))
                {
                    int nSave = DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_NEGATIVE, fDelay);

                    int nDamage = GetDamageBasedOnFeats(GetDiceRoll(nDiceNum, nDiceSize, nExtraDam), oTarget, SAVING_THROW_WILL, nSave);

                    if (nTouch == 2) nDamage *= 2;

                    if (nDamage > 0)
                    {
                        DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage, nDamageType));
                    }
                    if (nStrength > 0)
                    {
                        effect eLink = EffectLinkEffects(EffectAbilityDecrease(ABILITY_STRENGTH, nStrength),
                                                         EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_PERMANENT, eLink, oTarget));
                    }
                    if (nStrength > 0 || nDamage > 0)
                    {
                        DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                    }
                }
            }
        }
    }
}

