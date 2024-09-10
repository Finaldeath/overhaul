//::///////////////////////////////////////////////
//:: Effect
//:: op_s_effect.nss
//:://////////////////////////////////////////////
/*
    Single target spells that do a particular effect. IE Saving throw
    or X. Make any effects ignore immunity since we do an nImmunity check. This
    stops people pausing and equipping an item that grants that immunity during
    gameplay.

    Horizikaul's Boom
    You blast the target with loud and high-pitched sounds. The target takes 1d4
    points of sonic damage per two caster levels (maximum 5d4) and must make a
    Will save or be deafened for 1d4 rounds (the deafness duration is not able
    to be extended, empowered or maximized).

    Energy Drain
    The target creature permanently loses 2d4 character levels. The negative
    levels cannot be dispelled and can only be restored with a Restoration or
    Greater Restoration spell.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Optional damage?
    int nDamageType = -1, nDiceNum, nDiceSize;
    int bSaveForDamage = TRUE;
    // Strength ability check result?
    int nStrengthCheckRoll = -1;
    // Saving throw and immunity?
    int nSavingThrow = -1, nSavingThrowType = SAVING_THROW_TYPE_NONE;
    int nImmunity = IMMUNITY_TYPE_NONE;
    // Effect we apply on a failed save
    effect eLink;
    int nDurationType = DURATION_TYPE_INSTANT;
    float fDuration = 0.0, fExtraDelay;
    // Special duration calculation. Not maximised or empowered.
    int nDurationDice, nDurationDiceSize;
    // VFX
    int nBeam = VFX_NONE, nVis = VFX_NONE, nDamVis = VFX_NONE, bDelayRandom = FALSE;
    // Can change to selective hostile
    int nTargetType    = SPELL_TARGET_STANDARDHOSTILE;
    int nTouchType     = TOUCH_NONE;
    int bUndeadGainHP  = FALSE;
    int nTempHP = 0;

    switch (nSpellId)
    {
        case SPELL_HORIZIKAULS_BOOM:
        {
            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_SONIC;
            nVis             = VFX_IMP_BLIND_DEAF_M;
            eLink            = EffectLinkEffects(EffectDeaf(),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
            bSaveForDamage   = FALSE;
            nDurationType    = DURATION_TYPE_TEMPORARY;
            nDurationDice    = 1;
            nDurationDiceSize = 4;
            nDamVis          = VFX_IMP_SONIC;
            nDamageType      = DAMAGE_TYPE_SONIC;
            nDiceNum         = clamp(nCasterLevel/2, 1, 5);
            nDiceSize        = 4;
        }
        break;
        case SPELL_ENERVATION:
        {
            nSavingThrow     = SAVING_THROW_FORT;
            nSavingThrowType = SAVING_THROW_TYPE_NEGATIVE;
            nImmunity        = IMMUNITY_TYPE_NEGATIVE_LEVEL;
            nBeam            = VFX_BEAM_BLACK;
            nVis             = VFX_IMP_REDUCE_ABILITY_SCORE;
            eLink            = SupernaturalEffect(EffectLinkEffects(EffectNegativeLevel(GetDiceRoll(1, 4)),
                                                                    EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
            nDurationType    = DURATION_TYPE_PERMANENT;
            nTempHP          = min((nCasterLevel/2) * 5, 25) ;
        }
        break;
        case SPELL_ENERGY_DRAIN:
        {
            nSavingThrow     = SAVING_THROW_FORT;
            nSavingThrowType = SAVING_THROW_TYPE_NEGATIVE;
            nImmunity        = IMMUNITY_TYPE_NEGATIVE_LEVEL;
            nBeam            = VFX_BEAM_BLACK;
            nVis             = VFX_IMP_REDUCE_ABILITY_SCORE;
            eLink            = SupernaturalEffect(EffectLinkEffects(EffectNegativeLevel(GetDiceRoll(2, 4)),
                                                                    EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));
            nDurationType    = DURATION_TYPE_PERMANENT;
            nTempHP          = d4(2) * 5;
        }
        break;
        default:
            Debug("[op_s_effect] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
            break;
    }

    // Touch attack
    int nTouchAttack = DoTouchAttack(oTarget, oCaster, nTouchType);

    // Beam regardless of attitude
    if (nBeam) ApplyBeamToObject(nBeam, oTarget, !nTouchAttack);

    // Special case for undead for Enervation/Energy Drain
    if (bUndeadGainHP)
    {
        if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
        {
            effect eHP = EffectTemporaryHitpoints(nTempHP);

            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eHP, oTarget, GetDuration(1, HOURS, FALSE));
        }
    }

    if (GetSpellTargetValid(oTarget, oCaster, nTargetType))
    {
        SignalSpellCastAt();

        float fDelay = 0.0;

        if (nTouchAttack)
        {
            if (!DoResistSpell(oTarget, oCaster, fDelay))
            {
                if (!GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity))
                {
                    // Saving throw or strength check?
                    int bSaved = FALSE;
                    if (nSavingThrow != -1)
                    {
                        bSaved = DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType, fDelay);
                    }
                    else if (nStrengthCheckRoll != -1)
                    {
                        // Ability check
                        bSaved = DoAbilityCheck(oTarget, oCaster, nStrengthCheckRoll, ABILITY_STRENGTH, ABILITY_DEXTERITY);
                    }

                    // Damage?
                    if (nDamageType != -1)
                    {
                        int nDamage = GetDiceRoll(nDiceNum, nDiceSize);

                        if (nTouchAttack == TOUCH_RESULT_CRITICAL_HIT) nDamage *= 2;

                        if (bSaveForDamage && nSavingThrow != -1)
                        {
                            nDamage = GetDamageBasedOnFeats(nDamage, oTarget, nSavingThrow, bSaved);
                        }

                        if (nDamage > 0)
                        {
                            if (nDamVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nDamVis, oTarget));
                            DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage, nDamageType));
                        }
                    }

                    if (!bSaved)
                    {
                        if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));

                        // Randomise duration?
                        if (nDurationDice > 0)
                        {
                            fDuration = RoundsToSeconds(GetDiceRoll(nDurationDice, nDurationDiceSize, 0, FALSE));
                        }

                        if (nDurationType == DURATION_TYPE_INSTANT ||
                            nDurationType == DURATION_TYPE_PERMANENT)
                        {
                            DelayCommand(fDelay, ApplySpellEffectToObject(nDurationType, eLink, oTarget));
                        }
                        else
                        {
                            DelayCommand(fDelay, ApplySpellEffectToObject(nDurationType, eLink, oTarget, fDuration));
                        }
                    }
                }
            }
        }
    }
}
