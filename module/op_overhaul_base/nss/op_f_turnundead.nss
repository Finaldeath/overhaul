//::///////////////////////////////////////////////
//:: Turn Undead
//:: op_f_turnundead.nss
//:://////////////////////////////////////////////
/*
    Turn Undead is a bit weird in NWN. It's not to PnP but works well enough.


*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nClericLevel = GetLevelByClass(CLASS_TYPE_CLERIC, oCaster);
    int nPaladinLevel = GetLevelByClass(CLASS_TYPE_PALADIN, oCaster);
    int nBlackguardlevel = GetLevelByClass(CLASS_TYPE_BLACKGUARD, oCaster);

    int nTurnLevel = nClericLevel;
    int nClassLevel = nClericLevel;

    // Blackguard or Paladin levels are added on. Can't be both.
    // They get Turn Undead at level 3, so n-2 level.
    if((nBlackguardlevel - 2) > 0 && (nBlackguardlevel > nPaladinLevel))
    {
        nClassLevel += (nBlackguardlevel - 2);
        nTurnLevel  += (nBlackguardlevel - 2);
    }
    else if((nPaladinLevel - 2) > 0)
    {
        nClassLevel += (nPaladinLevel - 2);
        nTurnLevel  += (nPaladinLevel - 2);
    }

    // Flags for bonus turning types
    int bElemental = GetHasFeat(FEAT_AIR_DOMAIN_POWER, oCaster) + GetHasFeat(FEAT_EARTH_DOMAIN_POWER, oCaster) + GetHasFeat(FEAT_FIRE_DOMAIN_POWER, oCaster) + GetHasFeat(FEAT_WATER_DOMAIN_POWER, oCaster);
    int bVermin = GetHasFeat(FEAT_PLANT_DOMAIN_POWER, oCaster);
    int bConstructs = GetHasFeat(FEAT_DESTRUCTION_DOMAIN_POWER, oCaster);
    int bGoodOrEvilDomain = GetHasFeat(FEAT_GOOD_DOMAIN_POWER, oCaster) + GetHasFeat(FEAT_EVIL_DOMAIN_POWER, oCaster);
    int bPlanar = GetHasFeat(FEAT_EPIC_PLANAR_TURNING, oCaster);

    // Flag for improved turning ability
    int bSun = GetHasFeat(FEAT_SUN_DOMAIN_POWER);

    // Make a turning check roll, modify if have the Sun Domain
    int nChrMod = GetAbilityModifier(ABILITY_CHARISMA);
    int nTurnCheck = d20() + nChrMod;              // The roll to apply to the max HD of undead that can be turned --> nTurnLevel
    int nTurnHD = d6(2) + nChrMod + nClassLevel;   // The number of HD of undead that can be turned.

    float fDuration = GetDuration(nClassLevel + 5, ROUNDS);

    if(bSun)
    {
        nTurnCheck += d4();
        nTurnHD += d6();
    }
    // Determine the maximum HD of the undead that can be turned.
    if(nTurnCheck <= 0)
    {
        nTurnLevel -= 4;
    }
    else if(nTurnCheck >= 1 && nTurnCheck <= 3)
    {
        nTurnLevel -= 3;
    }
    else if(nTurnCheck >= 4 && nTurnCheck <= 6)
    {
        nTurnLevel -= 2;
    }
    else if(nTurnCheck >= 7 && nTurnCheck <= 9)
    {
        nTurnLevel -= 1;
    }
    else if(nTurnCheck >= 10 && nTurnCheck <= 12)
    {
        // Stays the same
    }
    else if(nTurnCheck >= 13 && nTurnCheck <= 15)
    {
        nTurnLevel += 1;
    }
    else if(nTurnCheck >= 16 && nTurnCheck <= 18)
    {
        nTurnLevel += 2;
    }
    else if(nTurnCheck >= 19 && nTurnCheck <= 21)
    {
        nTurnLevel += 3;
    }
    else if(nTurnCheck >= 22)
    {
        nTurnLevel += 4;
    }

    // Gets all creatures in a 20m radius around the caster and turns them or not.  If the creatures
    // HD are 1/2 or less of the nClassLevel then the creature is destroyed.
    int nHD, nHDCount;

    // Turn Effect
    effect eLink = EffectLinkEffects(EffectTurned(),
                   EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR),
                                     EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));

    // Destroy ignores death immunity.
    effect eDeath = IgnoreEffectImmunity(EffectDeath(TRUE));

    ApplyVisualEffectAtLocation(VFX_FNF_LOS_HOLY_30, lTarget);

    // Get nearest enemy within 20m (60ft)
    // We do LOS checks then a seen check further down.
    // We also only target enemies, not just "not friends".
    json jArray = GetArrayOfTargets(SPELL_TARGET_SELECTIVEHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        if (!GetIsDead(oTarget) && GetObjectSeen(oTarget, oCaster))
        {
            // Fire this at everyone just to make them angry / remove invisibility.
            SignalSpellCastAt();

            float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

            int nRacial = GetRacialType(oTarget);

            if (nRacial == RACIAL_TYPE_OUTSIDER)
            {
                if (bPlanar)
                {
                     // Planar turning decreases spell resistance against turning by 1/2
                     nHD = GetHitDice(oTarget) + (GetSpellResistance(oTarget) /2) + GetTurnResistanceHD(oTarget);
                }
                else
                {
                    nHD = GetHitDice(oTarget) + (GetSpellResistance(oTarget) + GetTurnResistanceHD(oTarget));
                }
            }
            else // (full turn resistance)
            {
                nHD = GetHitDice(oTarget) + GetTurnResistanceHD(oTarget);
            }

            if(nHD <= nTurnLevel && nHD <= (nTurnHD - nHDCount))
            {
                int bValid = FALSE;
                // Check the various domain turning types
                if (nRacial == RACIAL_TYPE_UNDEAD)
                {
                    bValid = TRUE;
                }
                else if (nRacial == RACIAL_TYPE_VERMIN && bVermin)
                {
                    bValid = TRUE;
                }
                else if (nRacial == RACIAL_TYPE_ELEMENTAL && bElemental)
                {
                    bValid = TRUE;
                }
                else if (nRacial == RACIAL_TYPE_CONSTRUCT && bConstructs)
                {
                    SignalSpellCastAt();
                    DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_SUNSTRIKE, d3(nTurnLevel), DAMAGE_TYPE_POSITIVE));
                    nHDCount += nHD;
                }
                else if (nRacial == RACIAL_TYPE_OUTSIDER && (bGoodOrEvilDomain || bPlanar))
                {
                    bValid = TRUE;
                }
                // If wearing Gauntlets of the Lich, then can be turned
                else if (GetTag(GetItemInSlot(INVENTORY_SLOT_ARMS)) == "x2_gauntletlich")
                {
                    bValid = TRUE;
                }

                // Apply results of the turn
                if (bValid)
                {
                    DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_SUNSTRIKE, oTarget));

                    if (bPlanar > 0 && nRacial == RACIAL_TYPE_OUTSIDER)
                    {
                        effect ePlane = EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_HOLY);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, ePlane, oTarget);
                    }

                    // Double the HD we will destroy (kill) it.
                    if ((nClassLevel/2) >= nHD)
                    {
                        if (nRacial == RACIAL_TYPE_OUTSIDER && bPlanar)
                        {
                            DelayCommand(fDelay - 0.1, ApplyVisualEffectToObject(VFX_IMP_UNSUMMON, oTarget));
                        }
                        // Destroy the target
                        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget));
                    }
                    else
                    {
                        // Turn the target
                        DelayCommand(fDelay - 0.01, AssignCommand(oTarget, ActionMoveAwayFromObject(oCaster, TRUE)));
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                    }
                    nHDCount += nHD;
                }
            }
        }
    }
}

