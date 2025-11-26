//:://////////////////////////////////////////////
//:: Breath Abilities
//:: op_a_breath
//:://////////////////////////////////////////////
/*
    Red Dragon Disciple Breath
    Static DC 19, damage increases over time.

    Dragon Breaths
        Acid
        Cold
        Fear
        Fire
        Gas
        Lightning
        Negative Energy
        Paralysis
        Sleep
        Slow
        Weaken

    Wyrmling Breaths
        Acid
        Cold
        Fire
        Gas
        Lightning

    Breaths:
        Hell Hound Fire Breath (added Reflex save and scaling damage)
        Iron Golem Poison Breath

    Ones not here:

    Prismatic is in op_s_prismatic

    Breath, Petrify is in op_s_petrify

    There's a lot of stuff copied from the base scripts since the damage scaling
    and DCs are not consistent. Fixed a few inconsistencies as well.
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
    int bDragonBreath = FALSE;
    int nAppliedEffect = -1;
    int nImmunity = -1;
    int nDuration;

    switch (nSpellId)
    {
        case SPELLABILITY_DRAGON_DISCIPLE_BREATH:
        {
            nSpellSaveDC = 19;

            int nLevel = GetLevelByClass(CLASS_TYPE_DRAGON_DISCIPLE, oCaster);

            if (nLevel < 7)
            {
                nDiceNum = 2;
            }
            else if (nLevel < 10)
            {
                nDiceNum = 4;
            }
            else if (nLevel == 10)
            {
                nDiceNum = 6;
            }
            else
            {
                nDiceNum = 6 + ((nLevel - 10)/3);
                nSpellSaveDC += ((nLevel - 10)/4);
            }

            nDiceSize        = 10;
            nDamageType      = DAMAGE_TYPE_FIRE;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
            nImpact          = VFX_FNF_DRAGBREATHGROUND;
            nVis             = VFX_IMP_FLAME_M;
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_ACID:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_ACID;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ACID;
            nVis             = VFX_IMP_ACID_S;

            // Use the HD of the creature to determine damage and save DC
            nDiceSize = 4;
            int nAge = GetHitDice(oCaster);
            if (nAge <= 6) //Wyrmling
            {
                nDiceNum = 2;
                nSpellSaveDC = 13;
            }
            else if (nAge >= 7 && nAge <= 9) //Very Young
            {
                nDiceNum = 4;
                nSpellSaveDC = 14;
            }
            else if (nAge >= 10 && nAge <= 12) //Young
            {
                nDiceNum = 6;
                nSpellSaveDC = 17;
            }
            else if (nAge >= 13 && nAge <= 15) //Juvenile
            {
                nDiceNum = 8;
                nSpellSaveDC = 18;
            }
            else if (nAge >= 16 && nAge <= 18) //Young Adult
            {
                nDiceNum = 10;
                nSpellSaveDC = 22;
            }
            else if (nAge >= 19 && nAge <= 21) //Adult
            {
                nDiceNum = 12;
                nSpellSaveDC = 23;
            }
            else if (nAge >= 22 && nAge <= 24) //Mature Adult
            {
                nDiceNum = 14;
                nSpellSaveDC = 26;
            }
            else if (nAge >= 25 && nAge <= 27) //Old
            {
                nDiceNum = 16;
                nSpellSaveDC = 27;
            }
            else if (nAge >= 28 && nAge <= 30) //Very Old
            {
                nDiceNum = 18;
                nSpellSaveDC = 30;
            }
            else if (nAge >= 31 && nAge <= 33) //Ancient
            {
                nDiceNum = 20;
                nSpellSaveDC = 31;
            }
            else if (nAge >= 34 && nAge <= 37) //Wyrm
            {
                nDiceNum = 24;
                nSpellSaveDC = 34;
            }
            else if (nAge > 37) //Great Wyrm
            {
                nDiceNum = 24;
                nSpellSaveDC = 36;
            }
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_COLD:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_COLD;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_COLD;
            nVis             = VFX_IMP_FROST_S;

            // Use the HD of the creature to determine damage and save DC
            nDiceSize = 6;
            int nAge = GetHitDice(oCaster);
            if (nAge <= 6) //Wyrmling
            {
                nDiceNum = 1;
                nSpellSaveDC = 12;
            }
            else if (nAge >= 7 && nAge <= 9) //Very Young
            {
                nDiceNum = 2;
                nSpellSaveDC = 14;
            }
            else if (nAge >= 10 && nAge <= 12) //Young
            {
                nDiceNum = 3;
                nSpellSaveDC = 16;
            }
            else if (nAge >= 13 && nAge <= 15) //Juvenile
            {
                nDiceNum = 4;
                nSpellSaveDC = 18;
            }
            else if (nAge >= 16 && nAge <= 18) //Young Adult
            {
                nDiceNum = 5;
                nSpellSaveDC = 20;
            }
            else if (nAge >= 19 && nAge <= 21) //Adult
            {
                nDiceNum = 6;
                nSpellSaveDC = 23;
            }
            else if (nAge >= 22 && nAge <= 24) //Mature Adult
            {
                nDiceNum = 7;
                nSpellSaveDC = 25;
            }
            else if (nAge >= 25 && nAge <= 27) //Old
            {
                nDiceNum = 8;
                nSpellSaveDC = 27;
            }
            else if (nAge >= 28 && nAge <= 30) //Very Old
            {
                nDiceNum = 9;
                nSpellSaveDC = 29;
            }
            else if (nAge >= 31 && nAge <= 33) //Ancient
            {
                nDiceNum = 10;
                nSpellSaveDC = 31;
            }
            else if (nAge >= 34 && nAge <= 37) //Wyrm
            {
                nDiceNum = 11;
                nSpellSaveDC = 33;
            }
            else if (nAge > 37) //Great Wyrm
            {
                nDiceNum = 12;
                nSpellSaveDC = 36;
            }
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_FEAR:
        {
            bDragonBreath = TRUE;

            nTargetType      = SPELL_TARGET_SELECTIVEHOSTILE;
            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_FEAR;
            nVis             = VFX_IMP_FEAR_S;
            nAppliedEffect   = EFFECT_TYPE_FRIGHTENED;
            nImmunity        = IMMUNITY_TYPE_FEAR;

            // Use the HD of the creature to determine save DC
            int nAge = GetHitDice(oCaster);
            nDuration = nAge;
            if (nAge <= 6) //Wyrmling
            {
                nSpellSaveDC = 13;
            }
            else if (nAge >= 7 && nAge <= 9) //Very Young
            {
                nSpellSaveDC = 15;
            }
            else if (nAge >= 10 && nAge <= 12) //Young
            {
                nSpellSaveDC = 17;
            }
            else if (nAge >= 13 && nAge <= 15) //Juvenile
            {
                nSpellSaveDC = 19;
            }
            else if (nAge >= 16 && nAge <= 18) //Young Adult
            {
                nSpellSaveDC = 21;
            }
            else if (nAge >= 19 && nAge <= 21) //Adult
            {
                nSpellSaveDC = 24;
            }
            else if (nAge >= 22 && nAge <= 24) //Mature Adult
            {
                nSpellSaveDC = 27;
            }
            else if (nAge >= 25 && nAge <= 27) //Old
            {
                nSpellSaveDC = 28;
            }
            else if (nAge >= 28 && nAge <= 30) //Very Old
            {
                nSpellSaveDC = 30;
            }
            else if (nAge >= 31 && nAge <= 33) //Ancient
            {
                nSpellSaveDC = 32;
            }
            else if (nAge >= 34 && nAge <= 37) //Wyrm
            {
                nSpellSaveDC = 34;
            }
            else if (nAge > 37) //Great Wyrm
            {
                nSpellSaveDC = 37;
            }
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_FIRE:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_FIRE;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
            nVis             = VFX_IMP_FLAME_M;

            // Use the HD of the creature to determine damage and save DC
            nDiceSize = 10;
            int nAge = GetHitDice(oCaster);
            if (nAge <= 6) //Wyrmling
            {
                nDiceNum = 1;
                nSpellSaveDC = 15;
            }
            else if (nAge >= 7 && nAge <= 9) //Very Young
            {
                nDiceNum = 4;
                nSpellSaveDC = 18;
            }
            else if (nAge >= 10 && nAge <= 12) //Young
            {
                nDiceNum = 6;
                nSpellSaveDC = 19;
            }
            else if (nAge >= 13 && nAge <= 15) //Juvenile
            {
                nDiceNum = 8;
                nSpellSaveDC = 22;
            }
            else if (nAge >= 16 && nAge <= 18) //Young Adult
            {
                nDiceNum = 10;
                nSpellSaveDC = 24;
            }
            else if (nAge >= 19 && nAge <= 22) //Adult
            {
                nDiceNum = 12;
                nSpellSaveDC = 25;
            }
            else if (nAge >= 23 && nAge <= 24) //Mature Adult
            {
                nDiceNum = 14;
                nSpellSaveDC = 28;
            }
            else if (nAge >= 25 && nAge <= 27) //Old
            {
                nDiceNum = 16;
                nSpellSaveDC = 30;
            }
            else if (nAge >= 28 && nAge <= 30) //Very Old
            {
                nDiceNum = 18;
                nSpellSaveDC = 33;
            }
            else if (nAge >= 31 && nAge <= 33) //Ancient
            {
                nDiceNum = 20;
                nSpellSaveDC = 35;
            }
            else if (nAge >= 34 && nAge <= 37) //Wyrm
            {
                nDiceNum = 22;
                nSpellSaveDC = 38;
            }
            else if (nAge > 37) //Great Wyrm
            {
                nDiceNum = 24;
                nSpellSaveDC = 40;
            }
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_GAS:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_ACID;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ACID; // Could be SAVING_THROW_TYPE_POISON
            nVis             = VFX_IMP_POISON_L;

            // Use the HD of the creature to determine damage and save DC
            nDiceSize = 6;
            int nAge = GetHitDice(oCaster);
            if (nAge <= 6) //Wyrmling
            {
                nDiceNum = 2;
                nSpellSaveDC = 13;
            }
            else if (nAge >= 7 && nAge <= 9) //Very Young
            {
                nDiceNum = 4;
                nSpellSaveDC = 16;
            }
            else if (nAge >= 10 && nAge <= 12) //Young
            {
                nDiceNum = 6;
                nSpellSaveDC = 17;
            }
            else if (nAge >= 13 && nAge <= 15) //Juvenile
            {
                nDiceNum = 8;
                nSpellSaveDC = 20;
            }
            else if (nAge >= 16 && nAge <= 18) //Young Adult
            {
                nDiceNum = 10;
                nSpellSaveDC = 22;
            }
            else if (nAge >= 19 && nAge <= 21) //Adult
            {
                nDiceNum = 12;
                nSpellSaveDC = 25;
            }
            else if (nAge >= 22 && nAge <= 24) //Mature Adult
            {
                nDiceNum = 14;
                nSpellSaveDC = 26;
            }
            else if (nAge >= 25 && nAge <= 27) //Old
            {
                nDiceNum = 16;
                nSpellSaveDC = 29;
            }
            else if (nAge >= 28 && nAge <= 30) //Very Old
            {
                nDiceNum = 18;
                nSpellSaveDC = 30;
            }
            else if (nAge >= 31 && nAge <= 33) //Ancient
            {
                nDiceNum = 20;
                nSpellSaveDC = 33;
            }
            else if (nAge >= 34 && nAge <= 37) //Wyrm
            {
                nDiceNum = 22;
                nSpellSaveDC = 35;
            }
            else if (nAge > 37) //Great Wyrm
            {
                nDiceNum = 24;
                nSpellSaveDC = 37;
            }
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_LIGHTNING:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_ELECTRICAL;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ELECTRICITY;
            nVis             = VFX_IMP_LIGHTNING_S;

            // Use the HD of the creature to determine damage and save DC
            nDiceSize = 8;
            int nAge = GetHitDice(oCaster);
            if (nAge <= 6) //Wyrmling
            {
                nDiceNum = 2;
                nSpellSaveDC = 14;
            }
            else if (nAge >= 7 && nAge <= 9) //Very Young
            {
                nDiceNum = 4;
                nSpellSaveDC = 16;
            }
            else if (nAge >= 10 && nAge <= 12) //Young
            {
                nDiceNum = 6;
                nSpellSaveDC = 18;
            }
            else if (nAge >= 13 && nAge <= 15) //Juvenile
            {
                nDiceNum = 8;
                nSpellSaveDC = 20;
            }
            else if (nAge >= 16 && nAge <= 18) //Young Adult
            {
                nDiceNum = 10;
                nSpellSaveDC = 23;
            }
            else if (nAge >= 19 && nAge <= 21) //Adult
            {
                nDiceNum = 12;
                nSpellSaveDC = 25;
            }
            else if (nAge >= 22 && nAge <= 24) //Mature Adult
            {
                nDiceNum = 14;
                nSpellSaveDC = 27;
            }
            else if (nAge >= 25 && nAge <= 27) //Old
            {
                nDiceNum = 16;
                nSpellSaveDC = 29;
            }
            else if (nAge >= 28 && nAge <= 30) //Very Old
            {
                nDiceNum = 18;
                nSpellSaveDC = 31;
            }
            else if (nAge >= 31 && nAge <= 33) //Ancient
            {
                nDiceNum = 20;
                nSpellSaveDC = 33;
            }
            else if (nAge >= 34 && nAge <= 37) //Wyrm
            {
                nDiceNum = 22;
                nSpellSaveDC = 36;
            }
            else if (nAge > 37) //Great Wyrm
            {
                nDiceNum = 24;
                nSpellSaveDC = 37;
            }
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_PARALYZE:
        {
            bDragonBreath = TRUE;

            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_FEAR;
            nVis             = VFX_IMP_FEAR_S;
            nAppliedEffect   = EFFECT_TYPE_PARALYZE;
            nImmunity        = IMMUNITY_TYPE_PARALYSIS;

            // Determine save DC and duration of effect
            int nAge = GetHitDice(oCaster);
            if (nAge <= 6) //Wyrmling
            {
                nSpellSaveDC = 14;
                nDuration = 1;
            }
            else if (nAge >= 7 && nAge <= 9) //Very Young
            {
                nSpellSaveDC = 17;
                nDuration = 2;
            }
            else if (nAge >= 10 && nAge <= 12) //Young
            {
                nSpellSaveDC = 18;
                nDuration = 3;
            }
            else if (nAge >= 13 && nAge <= 15) //Juvenile
            {
                nSpellSaveDC = 21;
                nDuration = 4;
            }
            else if (nAge >= 16 && nAge <= 18) //Young Adult
            {
                nSpellSaveDC = 23;
                nDuration = 5;
            }
            else if (nAge >= 19 && nAge <= 21) //Adult
            {
                nSpellSaveDC = 26;
                nDuration = 6;
            }
            else if (nAge >= 22 && nAge <= 24) //Mature Adult
            {
                nSpellSaveDC = 27;
                nDuration = 7;
            }
            else if (nAge >= 25 && nAge <= 27) //Old
            {
                nSpellSaveDC = 30;
                nDuration = 8;
            }
            else if (nAge >= 28 && nAge <= 30) //Very Old
            {
                nSpellSaveDC = 31;
                nDuration = 9;
            }
            else if (nAge >= 31 && nAge <= 33) //Ancient
            {
                nSpellSaveDC = 34;
                nDuration = 10;
            }
            else if (nAge >= 34 && nAge <= 37) //Wyrm
            {
                nSpellSaveDC = 36;
                nDuration = 11;
            }
            else if (nAge > 37) //Great Wyrm
            {
                nSpellSaveDC = 39;
                nDuration = 12;
            }
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_SLEEP:
        {
            bDragonBreath = TRUE;

            nSavingThrow     = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            nVis             = VFX_IMP_SLEEP;
            nAppliedEffect   = EFFECT_TYPE_SLEEP;
            nImmunity        = IMMUNITY_TYPE_SLEEP;

            // Determine save DC and duration of effect
            int nAge = GetHitDice(oCaster);
            if (nAge <= 6) //Wyrmling
            {
                nSpellSaveDC = 13;
                nDuration = 1;
            }
            else if (nAge >= 7 && nAge <= 9) //Very Young
            {
                nSpellSaveDC = 14;
                nDuration = 2;
            }
            else if (nAge >= 10 && nAge <= 12) //Young
            {
                nSpellSaveDC = 17;
                nDuration = 3;
            }
            else if (nAge >= 13 && nAge <= 15) //Juvenile
            {
                nSpellSaveDC = 18;
                nDuration = 4;
            }
            else if (nAge >= 16 && nAge <= 18) //Young Adult
            {
                nSpellSaveDC = 21;
                nDuration = 5;
            }
            else if (nAge >= 19 && nAge <= 21) //Adult
            {
                nSpellSaveDC = 23;
                nDuration = 6;
            }
            else if (nAge >= 22 && nAge <= 24) //Mature Adult
            {
                nSpellSaveDC = 26;
                nDuration = 7;
            }
            else if (nAge >= 25 && nAge <= 27) //Old
            {
                nSpellSaveDC = 27;
                nDuration = 8;
            }
            else if (nAge >= 28 && nAge <= 30) //Very Old
            {
                nSpellSaveDC = 30;
                nDuration = 9;
            }
            else if (nAge >= 31 && nAge <= 33) //Ancient
            {
                nSpellSaveDC = 31;
                nDuration = 10;
            }
            else if (nAge >= 34 && nAge <= 37) //Wyrm
            {
                nSpellSaveDC = 34;
                nDuration = 11;
            }
            else if (nAge > 37) //Great Wyrm
            {
                nSpellSaveDC = 36;
                nDuration = 12;
            }
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_SLOW:
        {
            bDragonBreath = TRUE;

            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_NONE;
            nVis             = VFX_IMP_SLOW;
            nAppliedEffect   = EFFECT_TYPE_SLOW;
            nImmunity        = IMMUNITY_TYPE_SLOW;

            // Determine save DC and duration of effect
            int nAge = GetHitDice(oCaster);
            if (nAge <= 6) //Wyrmling
            {
                nSpellSaveDC = 13;
                nDuration = 1;
            }
            else if (nAge >= 7 && nAge <= 9) //Very Young
            {
                nSpellSaveDC = 14;
                nDuration = 2;
            }
            else if (nAge >= 10 && nAge <= 12) //Young
            {
                nSpellSaveDC = 17;
                nDuration = 3;
            }
            else if (nAge >= 13 && nAge <= 15) //Juvenile
            {
                nSpellSaveDC = 18;
                nDuration = 4;
            }
            else if (nAge >= 16 && nAge <= 18) //Young Adult
            {
                nSpellSaveDC = 21;
                nDuration = 5;
            }
            else if (nAge >= 19 && nAge <= 21) //Adult
            {
                nSpellSaveDC = 23;
                nDuration = 6;
            }
            else if (nAge >= 22 && nAge <= 24) //Mature Adult
            {
                nSpellSaveDC = 26;
                nDuration = 7;
            }
            else if (nAge >= 25 && nAge <= 27) //Old
            {
                nSpellSaveDC = 27;
                nDuration = 8;
            }
            else if (nAge >= 28 && nAge <= 30) //Very Old
            {
                nSpellSaveDC = 30;
                nDuration = 9;
            }
            else if (nAge >= 31 && nAge <= 33) //Ancient
            {
                nSpellSaveDC = 31;
                nDuration = 10;
            }
            else if (nAge >= 34 && nAge <= 37) //Wyrm
            {
                nSpellSaveDC = 34;
                nDuration = 11;
            }
            else if (nAge > 37) //Great Wyrm
            {
                nSpellSaveDC = 36;
                nDuration = 12;
            }
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_WEAKEN:
        {
            bDragonBreath = TRUE;

            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_NONE;
            nVis             = VFX_IMP_REDUCE_ABILITY_SCORE;
            nAppliedEffect   = EFFECT_TYPE_ABILITY_DECREASE;
            nImmunity        = IMMUNITY_TYPE_ABILITY_DECREASE;

            //Determine save DC and ability damage
            int nAge = GetHitDice(oCaster);
            if (nAge <= 6) //Wyrmling
            {
                nDuration = 1;
                nSpellSaveDC = 15;
            }
            else if (nAge >= 7 && nAge <= 9) //Very Young
            {
                nDuration = 2;
                nSpellSaveDC = 18;
            }
            else if (nAge >= 10 && nAge <= 12) //Young
            {
                nDuration = 3;
                nSpellSaveDC = 19;
            }
            else if (nAge >= 13 && nAge <= 15) //Juvenile
            {
                nDuration = 4;
                nSpellSaveDC = 22;
            }
            else if (nAge >= 16 && nAge <= 18) //Young Adult
            {
                nDuration = 5;
                nSpellSaveDC = 24;
            }
            else if (nAge >= 19 && nAge <= 21) //Adult
            {
                nDuration = 6;
                nSpellSaveDC = 25;
            }
            else if (nAge >= 22 && nAge <= 24) //Mature Adult
            {
                nDuration = 7;
                nSpellSaveDC = 28;
            }
            else if (nAge >= 25 && nAge <= 27) //Old
            {
                nDuration = 8;
                nSpellSaveDC = 30;
            }
            else if (nAge >= 28 && nAge <= 30) //Very Old
            {
                nDuration = 9;
                nSpellSaveDC = 33;
            }
            else if (nAge >= 31 && nAge <= 33) //Ancient
            {
                nDuration = 10;
                nSpellSaveDC = 35;
            }
            else if (nAge >= 34 && nAge <= 37) //Wyrm
            {
                nDuration = 11;
                nSpellSaveDC = 38;
            }
            else if (nAge > 37) //Great Wyrm
            {
                nDuration = 12;
                nSpellSaveDC = 40;
            }
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_NEGATIVE:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_NEGATIVE;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_NEGATIVE;
            nVis             = VFX_IMP_NEGATIVE_ENERGY;

            // NB: x2_s1_dragneg also included applying negative levels.
            // We don't do this here right now.

            // Use the HD of the creature to determine damage and save DC
            nDiceSize = 8;
            int nAge = GetHitDice(oCaster);
            if (nAge <= 6) //Wyrmling
            {
                nDiceNum = 2;
                nSpellSaveDC = 14;
            }
            else if (nAge >= 7 && nAge <= 9) //Very Young
            {
                nDiceNum = 4;
                nSpellSaveDC = 16;
            }
            else if (nAge >= 10 && nAge <= 12) //Young
            {
                nDiceNum = 6;
                nSpellSaveDC = 18;
            }
            else if (nAge >= 13 && nAge <= 15) //Juvenile
            {
                nDiceNum = 8;
                nSpellSaveDC = 20;
            }
            else if (nAge >= 16 && nAge <= 18) //Young Adult
            {
                nDiceNum = 10;
                nSpellSaveDC = 22;
            }
            else if (nAge >= 19 && nAge <= 21) //Adult
            {
                nDiceNum = 12;
                nSpellSaveDC = 24;
            }
            else if (nAge >= 22 && nAge <= 24) //Mature Adult
            {
                nDiceNum = 14;
                nSpellSaveDC = 26;
            }
            else if (nAge >= 25 && nAge <= 27) //Old
            {
                nDiceNum = 16;
                nSpellSaveDC = 29;
            }
            else if (nAge >= 28 && nAge <= 30) //Very Old
            {
                nDiceNum = 18;
                nSpellSaveDC = 32;
            }
            else if (nAge >= 31 && nAge <= 33) //Ancient
            {
                nDiceNum = 20;
                nSpellSaveDC = 34;
            }
            else if (nAge >= 34 && nAge < 37) //Wyrm
            {
                nDiceNum = 22;
                nSpellSaveDC = 37;
            }
            else if (nAge >= 37) //Great Wyrm
            {
                nDiceNum = 24;
                nSpellSaveDC = 39;
            }
        }
        break;
        case SPELLABILITY_WYRMLING_BREATH_COLD:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_COLD;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_COLD;
            nVis             = VFX_IMP_FROST_S;

            nSpellSaveDC = GetSpellabilitySaveDC(oCaster, SPELLABILITY_DC_NORMAL);

            // Use the HD of the creature to determine damage and save DC
            nDiceSize = 4;
            if (GetIsPolymorphed(oCaster))
            {
                nDiceNum = (GetLevelByClass(CLASS_TYPE_SHIFTER,oCaster)/2)+1;
            }
            else
            {
                nDiceNum = (GetHitDice(oCaster)/2) + 1;
            }
        }
        break;
        case SPELLABILITY_WYRMLING_BREATH_ACID:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_ACID;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ACID;
            nVis             = VFX_IMP_ACID_S;

            nSpellSaveDC = GetSpellabilitySaveDC(oCaster, SPELLABILITY_DC_NORMAL);

            // Use the HD of the creature to determine damage and save DC
            nDiceSize = 4;
            if (GetIsPolymorphed(oCaster))
            {
                nDiceNum = (GetLevelByClass(CLASS_TYPE_SHIFTER,OBJECT_SELF)/2)+1;
            }
            else
            {
                nDiceNum = (GetHitDice(oCaster)/2) + 1;
            }
        }
        break;
        case SPELLABILITY_WYRMLING_BREATH_FIRE:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_FIRE;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
            nVis             = VFX_IMP_FLAME_M;

            nSpellSaveDC = GetSpellabilitySaveDC(oCaster, SPELLABILITY_DC_NORMAL);

            // Use the HD of the creature to determine damage and save DC
            nDiceSize = 10;
            if (GetIsPolymorphed(oCaster))
            {
                nDiceNum = (GetLevelByClass(CLASS_TYPE_SHIFTER,OBJECT_SELF)/3)+1;
            }
            else
            {
                nDiceNum = (GetHitDice(oCaster)/3) + 1;
            }
        }
        break;
        case SPELLABILITY_WYRMLING_BREATH_GAS:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_ACID;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ACID;
            nVis             = VFX_IMP_ACID_S;

            nSpellSaveDC = GetSpellabilitySaveDC(oCaster, SPELLABILITY_DC_NORMAL);

            // Use the HD of the creature to determine damage and save DC
            nDiceSize = 6;
            if (GetIsPolymorphed(oCaster))
            {
                nDiceNum = (GetLevelByClass(CLASS_TYPE_SHIFTER,OBJECT_SELF)/2)+1;
            }
            else
            {
                nDiceNum = (GetHitDice(oCaster)/2) + 1;
            }
        }
        break;
        case SPELLABILITY_WYRMLING_BREATH_LIGHTNING:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_ELECTRICAL;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ELECTRICITY;
            nVis             = VFX_IMP_LIGHTNING_S;

            nSpellSaveDC = GetSpellabilitySaveDC(oCaster, SPELLABILITY_DC_NORMAL);

            // Use the HD of the creature to determine damage and save DC
            nDiceSize = 8;
            if (GetIsPolymorphed(oCaster))
            {
                nDiceNum = (GetLevelByClass(CLASS_TYPE_SHIFTER,OBJECT_SELF)/3)+1;
            }
            else
            {
                nDiceNum = (GetHitDice(oCaster)/3) + 1;
            }
        }
        break;
        case SPELLABILITY_HELL_HOUND_FIREBREATH:
        {
            nDamageType      = DAMAGE_TYPE_FIRE;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
            nVis             = VFX_IMP_FLAME_S;

            // This used to do:
            // 1d4 + 1 damage with no save
            // Now it does:
            // Scaling damage (1 + 1/3 HD d4, +1 / HD fire damage), with normal reflex save DC
            // Should effectively be the same at levels 1-2 and more from level 3+
            nSpellSaveDC = GetSpellabilitySaveDC(oCaster, SPELLABILITY_DC_NORMAL);

            // Use the HD of the creature to determine damage and save DC
            nDiceSize = 4;
            nDiceNum = (GetHitDice(oCaster)/3) + 1;
            nDiceBonus = GetHitDice(oCaster);
        }
        break;
        case SPELLABILITY_GOLEM_BREATH_GAS:
        {
            nSavingThrow = SAVING_THROW_NONE;
            nImmunity = IMMUNITY_TYPE_POISON;
            nAppliedEffect = EFFECT_TYPE_POISON;
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Debug("[op_a_breath] No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
            return;
        }
        break;
    }

    if (bDragonBreath && GetCanSpeak(oCaster))
    {
        if(d100() > 50)
        {
            PlayVoiceChat(VOICE_CHAT_BATTLECRY1, oCaster);
        }
        else
        {
            PlayVoiceChat(VOICE_CHAT_BATTLECRY2, oCaster);
        }
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
            int bSaved = DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType, fDelay);

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
            if (nAppliedEffect != -1 && GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
            {
                if (!bSaved)
                {
                    // Effect
                    effect eApply;
                    int nDurationType = DURATION_TYPE_TEMPORARY;
                    switch (nAppliedEffect)
                    {
                        case EFFECT_TYPE_FRIGHTENED:
                        case EFFECT_TYPE_SLEEP:
                        case EFFECT_TYPE_PARALYZE:
                        case EFFECT_TYPE_SLOW:
                        {
                            eApply = GetEffectLink(nAppliedEffect);
                        }
                        break;
                        case EFFECT_TYPE_ABILITY_DECREASE:
                        {
                            nDurationType = DURATION_TYPE_PERMANENT;
                            eApply = EffectLinkEffects(EffectAbilityDecrease(ABILITY_STRENGTH, nDuration),
                                                       EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
                        }
                        break;
                        case EFFECT_TYPE_POISON:
                        {
                            nDurationType = DURATION_TYPE_PERMANENT;
                            eApply = EffectPoison(POISON_IRON_GOLEM);
                        }
                        break;
                    }
                    float fDuration = GetDuration(nDuration, ROUNDS, nAppliedEffect);
                    eApply = ExtraordinaryEffect(eApply);

                    if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                    DelayCommand(fDelay, ApplySpellEffectToObject(nDurationType, eApply, oTarget, fDuration));
                }
            }
        }
    }
}

