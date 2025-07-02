//::///////////////////////////////////////////////
//:: Breath Abilities
//:: op_a_breath.nss
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
        Prismatic
        Sleep
        Slow
        Weaken

    There's a lot of stuff copied from the base scripts since the damage scaling
    and DCs are not consistent. Fixed a few inconsistencies as well.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void PlayDragonBattleCry();

void main()
{
    if (DoSpellHook()) return;

    int nDiceNum, nDiceSize, nDiceBonus, nDamageType, nSavingThrow, nSavingThrowType;
    int nDamagePower = DAMAGE_POWER_ENERGY;
    int nImpact = VFX_INVALID;
    int nVis = VFX_INVALID;
    int bDragonBreath = FALSE;

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

            nDamageType      = DAMAGE_TYPE_ACID;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ACID;
            nVis             = VFX_IMP_ACID_S;
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_COLD:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_COLD;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_COLD;
            nVis             = VFX_IMP_FROST_S;
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_FEAR:
        {
            bDragonBreath = TRUE;

            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_COLD;
            nVis             = VFX_IMP_FROST_S;
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_FIRE:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_FIRE;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
            nVis             = VFX_IMP_FLAME_M;
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_GAS:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_ACID;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_POISON;
            nVis             = VFX_IMP_FLAME_M;
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_LIGHTNING:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_ELECTRICAL;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ELECTRICITY;
            nVis             = VFX_IMP_LIGHTNING_M;
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_PARALYZE:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_ELECTRICAL;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ELECTRICITY;
            nVis             = VFX_IMP_LIGHTNING_M;
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_PRISMATIC:
        {
            bDragonBreath = TRUE;
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_SLEEP:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_ELECTRICAL;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ELECTRICITY;
            nVis             = VFX_IMP_LIGHTNING_M;
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_SLOW:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_ELECTRICAL;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ELECTRICITY;
            nVis             = VFX_IMP_LIGHTNING_M;
        }
        break;
        case SPELLABILITY_DRAGON_BREATH_WEAKEN:
        {
            bDragonBreath = TRUE;

            nDamageType      = DAMAGE_TYPE_ELECTRICAL;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ELECTRICITY;
            nVis             = VFX_IMP_LIGHTNING_M;
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Debug("[op_a_breath] No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
            return;
        }
        break;
    }

    if (bDragonBreath)
    {

    }

    if (nImpact != VFX_INVALID) ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        // Immunity checks
        //if (!bMustBeLiving || GetIsLiving(oTarget))
        {
            //if (!DoResistSpell(oTarget, oCaster, fDelay, bMagicResistance, TRUE, bMagicResistance))
            {
                // Roll damage
                int nDamage = GetDiceRoll(nDiceNum, nDiceSize, nDiceBonus);

                // Damage modification based on save (half, with Reflex allowing feats to reduce further)
                if (nSavingThrow != -1)
                {
                    int bSaved = DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType, fDelay);

                    nDamage = GetDamageBasedOnFeats(nDamage, oTarget, nSavingThrow, bSaved);
                }

                if (nDamage > 0)
                {
                    DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, nDamage, nDamageType, nDamagePower));
                }
            }
        }
    }
}

void PlayDragonBattleCry()
{
    if(d100() > 50)
    {
        PlayVoiceChat(VOICE_CHAT_BATTLECRY1);
    }
    else
    {
        PlayVoiceChat(VOICE_CHAT_BATTLECRY2);
    }
}
