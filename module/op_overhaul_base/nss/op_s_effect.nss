//:://////////////////////////////////////////////
//:: Effect
//:: op_s_effect
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

    Contagion
    The target creature is struck down with one of the following debilitating
    diseases, randomly chosen: Blinding Sickness, Cackle Fever, Filth Fever,
    Mind Fire, Red Ache, Shakes, or Slimy Doom.

    Poison
    The character inflicts the subject with a poison by making a successful
    melee touch attack. The poison deals 1d6 points of Strength damage
    immediately and another 1d6 points of Strength damage 1 minute later. Each
    instance of damage can be negated by a Fortitude save (DC 18).

    Quillfire
    The caster throws poisonous quills at a target, doing 1d8 points of acid
    damage (+1 per 2 levels of the caster - max +5), plus inflicting Scorpion
    Venom on the target if they fail a DC 18 Fortitude save.

    Doom
    The target creature receives a -2 modifier to all attack rolls, damage
    rolls, saving throws and skill checks.
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
    int nDamageType = -1, nDiceNum, nDiceSize, nDiceBonus = 0;
    int bSaveForDamage = TRUE;
    // Strength ability check result?
    int nStrengthCheckRoll = -1;
    // Saving throw and immunity?
    int nSavingThrow = SAVING_THROW_NONE, nSavingThrowType = SAVING_THROW_TYPE_NONE;
    int nImmunity = IMMUNITY_TYPE_NONE;
    // Effect we apply on a failed save
    effect eLink;
    int nDurationType = DURATION_TYPE_INSTANT;
    int nDurationValue = ROUNDS;
    int nDurationStatic = 0;
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

    // If set this will override nSpellId for the purposes of applying effects, so they may stack
    // (eg Poison or Disease spells)
    int bOverrideSpellId = FALSE;

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
        case SPELL_CONTAGION:
        {
            int nDisease;
            switch (Random(7))
            {
                case 0:
                    nDisease = DISEASE_BLINDING_SICKNESS;
                break;
                case 1:
                    nDisease = DISEASE_CACKLE_FEVER;
                break;
                case 2:
                    nDisease = DISEASE_FILTH_FEVER;
                break;
                case 3:
                    nDisease = DISEASE_MINDFIRE;
                break;
                case 4:
                    nDisease = DISEASE_RED_ACHE;
                break;
                case 5:
                    nDisease = DISEASE_SHAKES;
                break;
                case 6:
                    nDisease = DISEASE_SLIMY_DOOM;
                break;
            }
            nImmunity        = IMMUNITY_TYPE_DISEASE;
            eLink            = SetEffectSpellId(SupernaturalEffect(EffectDisease(nDisease)), SPELL_INVALID);
            nDurationType    = DURATION_TYPE_PERMANENT;
            bOverrideSpellId = TRUE;
        }
        break;
        case SPELL_POISON:
        {
            nImmunity        = IMMUNITY_TYPE_POISON;
            eLink            = SetEffectSpellId(SupernaturalEffect(EffectPoison(POISON_LARGE_SCORPION_VENOM)), SPELL_INVALID);
            nDurationType    = DURATION_TYPE_PERMANENT;
            bOverrideSpellId = TRUE;
        }
        break;
        case SPELL_QUILLFIRE:
        {
            nImmunity        = IMMUNITY_TYPE_POISON;
            nVis             = VFX_IMP_ACID_S;
            nDamageType      = DAMAGE_TYPE_ACID;
            nDiceNum         = 1;
            nDiceSize        = 8;
            nDiceBonus       = min(5, nCasterLevel/2);
            eLink            = SetEffectSpellId(SupernaturalEffect(EffectPoison(POISON_LARGE_SCORPION_VENOM)), SPELL_INVALID);
            nDurationType    = DURATION_TYPE_PERMANENT;
            bOverrideSpellId = TRUE;
        }
        break;
        case SPELL_DOOM:
        {
            nVis      = VFX_IMP_DOOM;
            nImmunity = IMMUNITY_TYPE_MIND_SPELLS;
            eLink     = EffectLinkEffects(EffectDamageDecrease(2, DAMAGE_TYPE_BLUDGEONING | DAMAGE_TYPE_SLASHING | DAMAGE_TYPE_PIERCING),
                        EffectLinkEffects(EffectSavingThrowDecrease(SAVING_THROW_ALL, 2),
                        EffectLinkEffects(EffectAttackDecrease(2),
                        EffectLinkEffects(EffectSkillDecrease(SKILL_ALL_SKILLS, 2),
                                          EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)))));
            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            nDurationType    = DURATION_TYPE_TEMPORARY;
            nDurationStatic  = nCasterLevel;
            nDurationValue   = MINUTES;
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
                    if (nSavingThrow != SAVING_THROW_NONE)
                    {
                        bSaved = DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType, fDelay);
                    }
                    else if (nStrengthCheckRoll != -1)
                    {
                        // Ability check
                        bSaved = DoAbilityCheck(oTarget, oCaster, nStrengthCheckRoll, ABILITY_STRENGTH, ABILITY_DEXTERITY);
                    }

                    // Change spell ID at this point
                    if (bOverrideSpellId)
                    {
                        nSpellId = SPELL_INVALID;
                    }

                    // Damage?
                    if (nDamageType != -1)
                    {
                        int nDamage = GetDiceRoll(nDiceNum, nDiceSize, nDiceBonus);

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
                            fDuration = GetDuration(GetDiceRoll(nDurationDice, nDurationDiceSize, 0, FALSE), nDurationValue);
                        }
                        else if (nDurationStatic > 0)
                        {
                            fDuration = GetDuration(nDurationStatic, nDurationValue);
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
