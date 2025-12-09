//:://////////////////////////////////////////////
//:: Cone Abilities
//:: op_a_cone
//:://////////////////////////////////////////////
/*
    A mixture of damage and effect cones. Cones are pretty basic AOEs usually,
    just splitting some of the monster abilities into separate files to have
    it be slightly more organised.

    Beholder Antimagic Cone
    Cone of Acid
    Cone of Disease
    Cone of Fire
    Cone of Frost
    Cone of Lightning
    Cone of Poison
    Cone of Sonic
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nDiceNum, nDiceSize, nDiceBonus, nDamageType;
    int nSavingThrow = SAVING_THROW_NONE;
    int nSavingThrowType = SAVING_THROW_TYPE_NONE;
    int nDamagePower = DAMAGE_POWER_ENERGY;
    int nTargetType = SPELL_TARGET_STANDARDHOSTILE;
    int nVis = VFX_INVALID;
    int bApplyEffect = FALSE;
    effect eApply;
    int nImmunity = -1;
    // Basically Antimagic Cone only effects
    int bDispelMagic = FALSE;
    int nObjectType = OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE;

    // Special for Lightning
    int bLightning = FALSE;

    int nHD = GetHitDice(oCaster);

    switch (nSpellId)
    {
        case SPELLABILITY_BEHOLDER_ANTIMAGIC_CONE:
        {
            nVis = VFX_IMP_BREACH;
            bDispelMagic = TRUE;
            // What we dispel
            nObjectType = OBJECT_TYPE_CREATURE | OBJECT_TYPE_ITEM | OBJECT_TYPE_AREA_OF_EFFECT;
        }
        break;
        case SPELLABILITY_CONE_ACID:
        {
            nSpellSaveDC = 10 + (nHD/2);
            // 2d6 per 3 levels
            nDiceNum = 2 * max(1, nHD/3);
            nDiceSize = 6;
            nVis = VFX_IMP_ACID_S;
            nDamageType = DAMAGE_TYPE_ACID;
            nSavingThrow = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ACID;
        }
        break;
        case SPELLABILITY_CONE_COLD:// Cone of Frost
        {
            nSpellSaveDC = 10 + (nHD/2);
            // 2d6 per 3 levels
            nDiceNum = 2 * max(1, nHD/3);
            nDiceSize = 6;
            nVis = VFX_IMP_FROST_S;
            nDamageType = DAMAGE_TYPE_COLD;
            nSavingThrow = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_COLD;
        }
        break;
        case SPELLABILITY_CONE_DISEASE:
        {
            nObjectType = OBJECT_TYPE_CREATURE;
            nImmunity = IMMUNITY_TYPE_DISEASE;
            nVis = VFX_IMP_DISEASE_S;

            int nDisease;
            switch (GetRacialType(oCaster))
            {
                case RACIAL_TYPE_OUTSIDER:
                    nDisease = DISEASE_DEMON_FEVER;
                break;
                case RACIAL_TYPE_VERMIN:
                    nDisease = DISEASE_VERMIN_MADNESS;
                break;
                case RACIAL_TYPE_UNDEAD:
                {
                    if(nHD <= 3)
                    {
                        nDisease = DISEASE_ZOMBIE_CREEP;
                    }
                    else if (nHD <= 10)
                    {
                        nDisease = DISEASE_GHOUL_ROT;
                    }
                    else //if(nHD > 10)
                    {
                        nDisease = DISEASE_MUMMY_ROT;
                    }
                }
                default:
                {
                    if(nHD <= 3)
                    {
                        nDisease = DISEASE_MINDFIRE;
                    }
                    else if (nHD <= 10)
                    {
                        nDisease = DISEASE_RED_ACHE;
                    }
                    else //if(nHD > 10)
                    {
                        nDisease = DISEASE_SHAKES;
                    }
                }
                break;
            }
            eApply = ExtraordinaryEffect(EffectDisease(nDisease));
        }
        break;
        case SPELLABILITY_CONE_FIRE:
        {
            nSpellSaveDC = 10 + (nHD/2);
            // 2d6 per 3 levels
            nDiceNum = 2 * max(1, nHD/3);
            nDiceSize = 6;
            nVis = VFX_IMP_FLAME_S;
            nDamageType = DAMAGE_TYPE_FIRE;
            nSavingThrow = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
        }
        break;
        case SPELLABILITY_CONE_LIGHTNING:
        {
            // Special VFX
            bLightning = TRUE;

            nSpellSaveDC = 10 + (nHD/2);
            // 2d6 per 3 levels
            nDiceNum = 2 * max(1, nHD/3);
            nDiceSize = 6;
            nVis = VFX_IMP_FLAME_S;
            nDamageType = VFX_BEAM_LIGHTNING;
            nSavingThrow = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
        }
        break;
        case SPELLABILITY_CONE_POISON:
        {
            nObjectType = OBJECT_TYPE_CREATURE;
            nImmunity = IMMUNITY_TYPE_DISEASE;
            nVis = VFX_IMP_DISEASE_S;

            int nPoison;
            switch (GetRacialType(oCaster))
            {
                case RACIAL_TYPE_OUTSIDER:
                {
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
                }
                break;
                case RACIAL_TYPE_VERMIN:
                {
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
                    else //if (nHD >= 18)
                    {
                        nPoison = POISON_COLOSSAL_SPIDER_VENOM;
                    }
                }
                break;
                default:
                {
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
                }
                break;
            }
            eApply = ExtraordinaryEffect(EffectPoison(nPoison));
        }
        break;
        case SPELLABILITY_CONE_SONIC:
        {
            nSpellSaveDC = 10 + (nHD/2);
            // 2d6 per 3 levels
            nDiceNum = 2 * max(1, nHD/3);
            nDiceSize = 6;
            nVis = VFX_IMP_SONIC;
            nDamageType = DAMAGE_TYPE_FIRE;
            nSavingThrow = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_SONIC;
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE, nObjectType);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        // Antimagic cone
        if (bDispelMagic)
        {
            // Dispel - caster level is too high to contemplate!
            DoDispelMagic(oTarget, CASTER_LEVEL_ALWAYS_SUCCEEDS, nVis, fDelay, TRUE);

            if (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
            {
                // Apply the failure for 9 seconds. A rare neutral (negative + positive) effect!
                effect eLink = EffectLinkEffects(EffectSpellFailure(100),
                               EffectLinkEffects(EffectSpellImmunity(SPELL_ALL_SPELLS),
                               EffectLinkEffects(EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BLUE),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_NEUTRAL))));
                eLink = ExtraordinaryEffect(eLink);

                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, 9.0));
            }
        }
        else
        {
            SignalSpellCastAt();

            if (bLightning)
            {
                ApplyBeamToObject(VFX_BEAM_LIGHTNING, oTarget);
            }

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
                if (bApplyEffect && GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
                {
                    if (!bSaved)
                    {
                        if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_PERMANENT, eApply, oTarget));
                    }
                }
            }
        }
    }
}


