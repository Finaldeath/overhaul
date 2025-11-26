//:://////////////////////////////////////////////
//:: Pulse Abilities
//:: op_a_pulse
//:://////////////////////////////////////////////
/*
    Difficulty Class, where applicable: 10 + 1 for every HD.
    Damage, where applicable: 1d6 per HD.
    Duration, where applicable: 1 round per HD.

    Pulse attacks are the most dangerous form of creature attack. A Pulse is a
    devastating wave of energy that affects all creatures, friend or foe, within
    10 feet. The following types of Pulses are available in the game:

    Direct Damage: Water Elemental Drown, Fire, Lightning, Cold.
    Negative Energy: Negative Energy Damage, Death, Level Drain, Ability Drain:
    Charisma, Ability Drain: Constitution, Ability Drain: Intelligence, Ability
    Drain: Dexterity or Ability Drain: Wisdom.
    Positive Energy: Holy
    Miscellaneous: Air Elemental Whirlwind, Disease, Vrock Spores, Poison

    ----

    There's a lot of stuff copied from the base scripts since the damage scaling
    and DCs are not consistent. Fixed a few inconsistencies as well.

    Not here (not really a pulse!): Mummy Bolster Undead, see Buffs
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nDiceNum, nDiceSize, nDiceBonus, nDamageType, nSavingThrow, nSavingThrowType;
    int nDamagePower = DAMAGE_POWER_ENERGY;
    int nTargetType = SPELL_TARGET_STANDARDHOSTILE;
    int nImpact = VFX_INVALID;
    int nVis = VFX_INVALID;
    int nBeam = VFX_INVALID;
    int bApplyEffect = FALSE;
    int bDrown = FALSE;
    int bHoly = FALSE;
    int bNegative = FALSE;
    int nDurationType = DURATION_TYPE_PERMANENT;
    float fDuration = 0.0;
    effect eLink;
    int nImmunity = IMMUNITY_TYPE_NONE;
    int nDuration;

    switch (nSpellId)
    {
        case SPELLABILITY_PULSE_ABILITY_DRAIN_CHARISMA:
        case SPELLABILITY_PULSE_ABILITY_DRAIN_CONSTITUTION:
        case SPELLABILITY_PULSE_ABILITY_DRAIN_DEXTERITY:
        case SPELLABILITY_PULSE_ABILITY_DRAIN_INTELLIGENCE:
        case SPELLABILITY_PULSE_ABILITY_DRAIN_STRENGTH:
        case SPELLABILITY_PULSE_ABILITY_DRAIN_WISDOM:
        {
            bApplyEffect = TRUE;

            int nAbility;
            switch (nSpellId)
            {
                case SPELLABILITY_PULSE_ABILITY_DRAIN_CHARISMA:     nAbility = ABILITY_CHARISMA; break;
                case SPELLABILITY_PULSE_ABILITY_DRAIN_CONSTITUTION: nAbility = ABILITY_CONSTITUTION; break;
                case SPELLABILITY_PULSE_ABILITY_DRAIN_DEXTERITY:    nAbility = ABILITY_DEXTERITY; break;
                case SPELLABILITY_PULSE_ABILITY_DRAIN_INTELLIGENCE: nAbility = ABILITY_INTELLIGENCE; break;
                case SPELLABILITY_PULSE_ABILITY_DRAIN_STRENGTH:     nAbility = ABILITY_STRENGTH; break;
                case SPELLABILITY_PULSE_ABILITY_DRAIN_WISDOM:       nAbility = ABILITY_WISDOM; break;
            }
            int nAmount = max(1, GetHitDice(oCaster)/5);
            eLink = SupernaturalEffect(EffectAbilityDecrease(nAbility, nAmount));
            nDurationType = DURATION_TYPE_PERMANENT;

            nSavingThrow = SAVING_THROW_FORT;
            nSavingThrowType = SAVING_THROW_TYPE_NEGATIVE;
            // 10 + HD Spell Save DC
            nSpellSaveDC = GetSpellabilitySaveDC(oCaster, SPELLABILITY_DC_HARD);

            nImmunity = IMMUNITY_TYPE_ABILITY_DECREASE;
            nVis = VFX_IMP_NEGATIVE_ENERGY;
            nImpact = VFX_IMP_PULSE_NEGATIVE;
        }
        break;
        case SPELLABILITY_PULSE_COLD:
        {
            nDiceNum = GetHitDice(oCaster);
            nDiceSize = 6;

            nDamageType = DAMAGE_TYPE_COLD;
            nVis = VFX_IMP_FROST_S;
            nImpact = VFX_IMP_PULSE_COLD;

            nSavingThrow = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_COLD;
            // 10 + HD Spell Save DC
            nSpellSaveDC = GetSpellabilitySaveDC(oCaster, SPELLABILITY_DC_HARD);
        }
        break;
        case SPELLABILITY_PULSE_DEATH:
        {
            bApplyEffect = TRUE;
            eLink = IgnoreEffectImmunity(EffectDeath());
            nDurationType = DURATION_TYPE_INSTANT;
            nImmunity = IMMUNITY_TYPE_DEATH;
            nVis = VFX_IMP_DEATH;
            nImpact = VFX_IMP_PULSE_NEGATIVE;

            nSavingThrow = SAVING_THROW_FORT;
            nSavingThrowType = SAVING_THROW_TYPE_DEATH;
            // 10 + HD Spell Save DC
            nSpellSaveDC = GetSpellabilitySaveDC(oCaster, SPELLABILITY_DC_HARD);
        }
        break;
        case SPELLABILITY_PULSE_DISEASE:
        case SPELLABILITY_PULSE_SPORES:
        {
            bApplyEffect = TRUE;
            // Determine the disease type based on the Racial Type
            int nDisease;
            if (nSpellId == SPELLABILITY_PULSE_SPORES)
            {
                nDisease = DISEASE_SOLDIER_SHAKES;
            }
            else
            {
                switch (GetRacialType(oCaster))
                {
                    case RACIAL_TYPE_VERMIN:
                        nDisease = DISEASE_VERMIN_MADNESS;
                    break;
                    case RACIAL_TYPE_UNDEAD:
                        nDisease = DISEASE_FILTH_FEVER;
                    break;
                    case RACIAL_TYPE_OUTSIDER:
                        nDisease = DISEASE_DEMON_FEVER;
                    break;
                    case RACIAL_TYPE_MAGICAL_BEAST:
                        nDisease = DISEASE_SOLDIER_SHAKES;
                    break;
                    case RACIAL_TYPE_ABERRATION:
                        nDisease = DISEASE_BLINDING_SICKNESS;
                    break;
                    default:
                        nDisease = DISEASE_MINDFIRE;
                    break;
                }
            }
            eLink = SupernaturalEffect(IgnoreEffectImmunity(EffectDisease(nDisease)));
            nDurationType = DURATION_TYPE_PERMANENT;
            nImmunity = IMMUNITY_TYPE_DISEASE;
            nImpact = VFX_IMP_PULSE_NATURE;
        }
        break;
        case SPELLABILITY_PULSE_DROWN:
        {
            // This damages you for half your HP
            ApplyDamageToObject(oCaster, GetCurrentHitPoints(oCaster)/2);

            // Special Drown immunity case
            bDrown = TRUE;

            bApplyEffect = TRUE;
            eLink = IgnoreEffectImmunity(EffectDeath());
            nDurationType = DURATION_TYPE_INSTANT;
            nVis = VFX_IMP_FROST_S;
            nImpact = VFX_IMP_PULSE_WATER;

            nSavingThrow = SAVING_THROW_FORT;
            // No death saving throw type as per Bioware
            // Static DC as per Bioware
            nSpellSaveDC = 20;
        }
        break;
        case SPELLABILITY_PULSE_FIRE:
        {
            nDiceNum = GetHitDice(oCaster);
            nDiceSize = 6;

            nDamageType = DAMAGE_TYPE_FIRE;
            nVis = VFX_IMP_FLAME_S;
            nImpact = VFX_IMP_PULSE_FIRE;

            nSavingThrow = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
            // 10 + HD Spell Save DC
            nSpellSaveDC = GetSpellabilitySaveDC(oCaster, SPELLABILITY_DC_HARD);
        }
        break;
        case SPELLABILITY_PULSE_HOLY:
        {
            // Damage and healing! Just define the damage.
            bHoly = TRUE;

            nDiceNum = GetHitDice(oCaster);
            nDiceSize = 4;

            nDamageType = DAMAGE_TYPE_DIVINE;
            nVis = VFX_IMP_SUNSTRIKE;
            nImpact = VFX_IMP_PULSE_HOLY;

            nSavingThrow = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_DIVINE;
            // 10 + HD Spell Save DC
            nSpellSaveDC = GetSpellabilitySaveDC(oCaster, SPELLABILITY_DC_HARD);
        }
        break;
        case SPELLABILITY_PULSE_LEVEL_DRAIN:
        {
            bApplyEffect = TRUE;
            eLink = IgnoreEffectImmunity(EffectNegativeLevel(1));
            nDurationType = DURATION_TYPE_PERMANENT;
            nImmunity = IMMUNITY_TYPE_NEGATIVE_LEVEL;
            nVis = VFX_IMP_NEGATIVE_ENERGY;
            nImpact = VFX_IMP_PULSE_NEGATIVE;

            nSavingThrow = SAVING_THROW_FORT;
            nSavingThrowType = SAVING_THROW_TYPE_NEGATIVE;
            // 10 + HD Spell Save DC
            nSpellSaveDC = GetSpellabilitySaveDC(oCaster, SPELLABILITY_DC_HARD);
        }
        break;
        case SPELLABILITY_PULSE_LIGHTNING:
        {
            nDiceNum = GetHitDice(oCaster);
            nDiceSize = 6;

            nDamageType = DAMAGE_TYPE_FIRE;
            nVis = VFX_IMP_FLAME_S;
            nImpact = VFX_IMP_PULSE_COLD; // TODO: New lightning pulse
            nBeam = VFX_BEAM_LIGHTNING;

            nSavingThrow = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
            // 10 + HD Spell Save DC
            nSpellSaveDC = GetSpellabilitySaveDC(oCaster, SPELLABILITY_DC_HARD);
        }
        break;
        case SPELLABILITY_PULSE_NEGATIVE:
        {
            // Damage and healing! Just define the damage.
            bNegative = TRUE;

            nDiceNum = GetHitDice(oCaster);
            nDiceSize = 4;

            nDamageType = DAMAGE_TYPE_DIVINE;
            nVis = VFX_IMP_NEGATIVE_ENERGY;
            nImpact = VFX_IMP_PULSE_NEGATIVE;

            nSavingThrow = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_NEGATIVE;
            // 10 + HD Spell Save DC
            nSpellSaveDC = GetSpellabilitySaveDC(oCaster, SPELLABILITY_DC_HARD);
        }
        break;
        case SPELLABILITY_PULSE_POISON:
        {
            bApplyEffect = TRUE;
            //Determine the poison type based on the Racial Type and HD
            int nPoison;
            int nHD = GetHitDice(oCaster);
            switch (GetRacialType(oCaster))
            {
                case RACIAL_TYPE_OUTSIDER:
                    if (nHD <= 9)
                    {
                        nPoison = POISON_QUASIT_VENOM;
                    }
                    else if (nHD < 13)
                    {
                        nPoison = POISON_BEBILITH_VENOM;
                    }
                    else //if (nHD >= 13)
                    {
                        nPoison = POISON_PIT_FIEND_ICHOR;
                    }
                break;
                case RACIAL_TYPE_VERMIN:
                    if (nHD < 3)
                    {
                        nPoison = POISON_TINY_SPIDER_VENOM;
                    }
                    else if (nHD < 6)
                    {
                        nPoison = POISON_SMALL_SPIDER_VENOM;
                    }
                    else if (nHD < 9)
                    {
                        nPoison = POISON_MEDIUM_SPIDER_VENOM;
                    }
                    else if (nHD < 12)
                    {
                        nPoison =  POISON_LARGE_SPIDER_VENOM;
                    }
                    else if (nHD < 15)
                    {
                        nPoison = POISON_HUGE_SPIDER_VENOM;
                    }
                    else if (nHD < 18)
                    {
                        nPoison = POISON_GARGANTUAN_SPIDER_VENOM;
                    }
                    else// if (nHD >= 18)
                    {
                        nPoison = POISON_COLOSSAL_SPIDER_VENOM;
                    }
                break;
                default:
                    if (nHD < 3)
                    {
                        nPoison = POISON_NIGHTSHADE;
                    }
                    else if (nHD < 6)
                    {
                        nPoison = POISON_BLADE_BANE;
                    }
                    else if (nHD < 9)
                    {
                        nPoison = POISON_BLOODROOT;
                    }
                    else if (nHD < 12)
                    {
                        nPoison =  POISON_LARGE_SPIDER_VENOM;
                    }
                    else if (nHD < 15)
                    {
                        nPoison = POISON_LICH_DUST;
                    }
                    else if (nHD < 18)
                    {
                        nPoison = POISON_DARK_REAVER_POWDER;
                    }
                    else //if (nHD >= 18 )
                    {
                        nPoison = POISON_BLACK_LOTUS_EXTRACT;
                    }
                break;
            }
            eLink = SupernaturalEffect(IgnoreEffectImmunity(EffectPoison(nPoison)));
            nDurationType = DURATION_TYPE_PERMANENT;
            nImmunity = IMMUNITY_TYPE_POISON;
            nImpact = VFX_IMP_PULSE_NATURE;
        }
        break;
        case SPELLABILITY_PULSE_WHIRLWIND:
        {
            bApplyEffect = TRUE;
            eLink = GetEffectLink(EFFECT_TYPE_KNOCKDOWN);
            nDurationType = DURATION_TYPE_TEMPORARY;
            fDuration = GetDuration(2, ROUNDS);

            nDiceNum = GetHitDice(oCaster);
            nDiceSize = 3;

            nDamageType = DAMAGE_TYPE_SLASHING;
            nImpact = VFX_IMP_PULSE_WIND;

            // The Bioware spell is an either/or for the reflex save but we'll just run it through the standard reflex feats
            nSavingThrow = SAVING_THROW_REFLEX;
            // Static 14 as per Bioware
            nSpellSaveDC = 14;
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Debug("[op_a_breath] No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
            return;
        }
        break;
    }

    if (nImpact != VFX_INVALID) ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        // Immunity checks
        if (nImmunity == -1 || GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity))
        {
            if (!bDrown ||
               (GetRacialType(oTarget) != RACIAL_TYPE_CONSTRUCT &&
                GetRacialType(oTarget) != RACIAL_TYPE_UNDEAD &&
                GetRacialType(oTarget) != RACIAL_TYPE_ELEMENTAL))
            {
                if ((!bHoly || GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD) &&
                    (!bNegative || GetRacialType(oTarget) != RACIAL_TYPE_UNDEAD))
                {
                    int bSaved = DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType, fDelay);

                    if (nBeam != VFX_INVALID) DelayCommand(fDelay, ApplyBeamToObject(nBeam, oTarget, FALSE, BODY_NODE_CHEST));

                    if (nDiceNum > 0)
                    {
                        // Roll damage
                        int nDamage = GetDiceRoll(nDiceNum, nDiceSize, nDiceBonus);

                        // Damage modification based on save (half, with Reflex allowing feats to reduce further)
                        nDamage = GetDamageBasedOnFeats(nDamage, oTarget, nSavingThrow, bSaved);

                        if (nDamage > 0)
                        {
                            DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, nVis, nDamage, nDamageType, nDamagePower));
                        }
                    }
                    // We can also (or only) apply an effect, only to creatures however.
                    if (bApplyEffect && GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
                    {
                        if (!bSaved)
                        {
                            if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                            DelayCommand(fDelay, ApplySpellEffectToObject(nDurationType, eLink, oTarget, fDuration));
                        }
                    }
                }
            }
        }
    }

    // Healing for Holy Pulse and Negative Pulse
    if (bHoly || bNegative)
    {
        json jArray = GetArrayOfTargets(SPELL_TARGET_ALLALLIES, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt(oTarget, oCaster, FALSE);

            float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

            if ((bHoly && GetRacialType(oTarget) != RACIAL_TYPE_UNDEAD &&
                 GetRacialType(oTarget) != RACIAL_TYPE_CONSTRUCT) ||
                (bNegative && GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD))
            {
                int nHeal = GetDiceRoll(nDiceNum, nDiceSize, nDiceBonus);
                effect eHeal = EffectHeal(nHeal);

                DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_HEALING_M, oTarget));
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget));
            }
        }
    }
}

