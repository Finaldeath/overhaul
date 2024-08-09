//::///////////////////////////////////////////////
//:: Summon Spells
//:: op_s_summon
//:://////////////////////////////////////////////
/*
    Many spells that use summon monsters.

    Dispel magica can affect these creatures, but the parent effect on the master
    should be made Extraordinary so the dispel magic routines don't touch it.

    Summon Creature spells may be renamed Summon Monster at some stage; to allow
    for Summon Natures Ally to be added.

    Usually Summon Creature spells last 1 round/level which at level 1 sucks in
    nwn since they get dismissed before they can do anything (AI can take up to
    6 seconds to activate).

    Might make a toggle to make it something like 1 minute/level or even
    1 round/level to have slightly better balance, if we start to change some
    stats or blueprints.

    NOTE: Might want to have the random summon elemental changed to a choice.
    In which case we might want to add choices to the rest.

    NOTE: Animal domain not implemented as Bioware's way, since we will rework
    the domain to include more spells (and have the domain feat cast Charm
    Animal) thus the +1 upgrade on these spells will be removed.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

// Get the last summon and fire a VFX at it
void VisualAtSummonsLocation(int nVFX)
{
    int nNth = 1;
    object oLastValid;
    object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oCaster, nNth);
    while (GetIsObjectValid(oSummon))
    {
        oLastValid = oSummon;
        oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oCaster, ++nNth);
    }
    if (GetIsObjectValid(oLastValid))
    {
        ApplyVisualEffectAtLocation(nVFX, GetLocation(oLastValid));
    }
}

void main()
{
    if (DoSpellHook()) return;

    // For now they're all getting 24 hour durations by default, may change
    float fDuration = GetDuration(24, HOURS);

    effect eSummon;
    int nImpact = VFX_NONE;

    // If set this will spawn the given creature (and optionally the nVis applied)
    string sSpawn = "";
    int nVis = VFX_NONE;

    switch (nSpellId)
    {
        case SPELL_SUMMON_CREATURE_I:
        {
            eSummon = EffectSummonCreature("NW_S_badgerdire", VFX_FNF_SUMMON_MONSTER_1);
        }
        break;
        case SPELL_SUMMON_CREATURE_II:
        {
            eSummon = EffectSummonCreature("NW_S_BOARDIRE", VFX_FNF_SUMMON_MONSTER_1);
        }
        break;
        case SPELL_SUMMON_CREATURE_III:
        {
            eSummon = EffectSummonCreature("NW_S_WOLFDIRE", VFX_FNF_SUMMON_MONSTER_1);
        }
        break;
        case SPELL_SUMMON_CREATURE_IV:
        {
            eSummon = EffectSummonCreature("NW_S_SPIDDIRE", VFX_FNF_SUMMON_MONSTER_2);
        }
        break;
        case SPELL_SUMMON_CREATURE_V:
        {
            eSummon = EffectSummonCreature("NW_S_beardire", VFX_FNF_SUMMON_MONSTER_2);
        }
        break;
        case SPELL_SUMMON_CREATURE_VI:
        {
            eSummon = EffectSummonCreature("NW_S_diretiger", VFX_FNF_SUMMON_MONSTER_2);
        }
        break;
        case SPELL_SUMMON_CREATURE_VII:
        {
            switch (d3())
            {
                case 1: eSummon = EffectSummonCreature("NW_S_AIRHUGE", VFX_FNF_SUMMON_MONSTER_3); break;
                case 2: eSummon = EffectSummonCreature("NW_S_WATERHUGE", VFX_FNF_SUMMON_MONSTER_3); break;
                case 3: eSummon = EffectSummonCreature("NW_S_FIREHUGE", VFX_FNF_SUMMON_MONSTER_3); break;
            }
        }
        break;
        case SPELL_SUMMON_CREATURE_VIII:
        {
            switch (d3())
            {
                case 1: eSummon = EffectSummonCreature("NW_S_AIRGREAT", VFX_FNF_SUMMON_MONSTER_3); break;
                case 2: eSummon = EffectSummonCreature("NW_S_WATERGREAT", VFX_FNF_SUMMON_MONSTER_3); break;
                case 3: eSummon = EffectSummonCreature("NW_S_FIREGREAT", VFX_FNF_SUMMON_MONSTER_3); break;
            }
        }
        break;
        case SPELL_SUMMON_CREATURE_IX:
        {
            switch (d3())
            {
                case 1: eSummon = EffectSummonCreature("NW_S_AIRELDER", VFX_FNF_SUMMON_MONSTER_3); break;
                case 2: eSummon = EffectSummonCreature("NW_S_WATERELDER", VFX_FNF_SUMMON_MONSTER_3); break;
                case 3: eSummon = EffectSummonCreature("NW_S_FIREELDER", VFX_FNF_SUMMON_MONSTER_3); break;
            }
        }
        case SPELL_ELEMENTAL_SWARM:
        {
            eSummon = EffectSwarm(FALSE, "NW_SW_AIRGREAT", "NW_SW_WATERGREAT", "NW_SW_EARTHGREAT", "NW_SW_FIREGREAT");
        }
        break;
        case SPELLABILITY_SUMMON_BAATEZU:
        {
            eSummon = EffectSummonCreature("x2_erinyes", VFX_FNF_SUMMON_MONSTER_3);
        }
        break;
        case SPELLABILITY_SUMMON_CELESTIAL:
        {
            eSummon = EffectSummonCreature("NW_S_CLANTERN", VFX_FNF_SUMMON_MONSTER_3);
        }
        break;
        case SPELLABILITY_SUMMON_MEPHIT:
        {
            eSummon = EffectSummonCreature("NW_S_MEPSTEAM", VFX_FNF_SUMMON_MONSTER_1);
        }
        break;
        case SPELLABILITY_SUMMON_SLAAD:
        {
            eSummon = EffectSummonCreature("NW_S_SLAADRED", VFX_FNF_SUMMON_MONSTER_3);
        }
        break;
        case SPELLABILITY_SUMMON_TANARRI:
        {
            eSummon = EffectSummonCreature("NW_S_SUCCUBUS", VFX_FNF_SUMMON_MONSTER_3);
        }
        break;
        case SPELL_EPIC_DRAGON_KNIGHT:
        {
            eSummon = EffectSummonCreature("x2_s_drgred001", VFX_FNF_SUMMONDRAGON, 0.0, TRUE);
            fDuration = GetDuration(20, ROUNDS);

            // Extra VFX of them landing
            DelayCommand(1.0, VisualAtSummonsLocation(VFX_IMP_DUST_EXPLOSION));
        }
        break;
        case SPELL_EPIC_MUMMY_DUST:
        {
            eSummon = EffectSummonCreature("X2_S_MUMMYWARR", VFX_FNF_SUMMON_EPIC_UNDEAD, 1.0f);
            fDuration = GetDuration(24, HOURS);
        }
        break;
        case SPELL_GATE:
        {
            if(GetHasSpellEffect(SPELL_PROTECTION_FROM_EVIL, oCaster) ||
               GetHasSpellEffect(SPELL_MAGIC_CIRCLE_AGAINST_EVIL, oCaster) ||
               GetHasSpellEffect(SPELL_HOLY_AURA, oCaster))
            {
                eSummon = EffectSummonCreature("NW_S_BALOR", VFX_FNF_SUMMON_GATE, 3.0);
                fDuration = GetDuration(24, ROUNDS);
            }
            else
            {
                nVis = VFX_FNF_SUMMON_GATE;
                sSpawn = "NW_S_BALOR_EVIL";
            }

        }
        break;
        case SPELL_ANIMATE_DEAD:
        case SPELLABILITY_PM_ANIMATE_DEAD:
        {
            if (nCasterLevel <= 5)
            {
                eSummon = EffectSummonCreature("NW_S_ZOMBTYRANT",VFX_FNF_SUMMON_UNDEAD);
            }
            else if (nCasterLevel <= 9)
            {
                eSummon = EffectSummonCreature("NW_S_SKELWARR",VFX_FNF_SUMMON_UNDEAD);
            }
            else
            {
                eSummon = EffectSummonCreature("NW_S_SKELCHIEF",VFX_FNF_SUMMON_UNDEAD);
            }
            fDuration = GetDuration(24, ROUNDS);
        }
        break;
        case SPELLABILITY_PM_SUMMON_UNDEAD:
        {
            nImpact = VFX_FNF_LOS_EVIL_10;
            nCasterLevel = GetLevelByClass(CLASS_TYPE_PALE_MASTER, oCaster);
            fDuration = GetDuration(14 + nCasterLevel, HOURS);
            if (nCasterLevel <= 5)
            {
                eSummon = EffectSummonCreature("NW_S_GHOUL",VFX_IMP_HARM,0.0f,0);
            }
            else if (nCasterLevel == 6)
            {
                eSummon = EffectSummonCreature("NW_S_SHADOW",VFX_IMP_HARM,0.0f,0);
            }
            else if (nCasterLevel == 7)
            {
                eSummon = EffectSummonCreature("NW_S_GHAST",VFX_IMP_HARM,0.0f,1);
            }
            else if (nCasterLevel == 8)
            {
                eSummon = EffectSummonCreature("NW_S_WIGHT",VFX_FNF_SUMMON_UNDEAD,0.0f,1);
            }
            else // if (nCasterLevel >= 9)
            {
                eSummon = EffectSummonCreature("X2_S_WRAITH",VFX_FNF_SUMMON_UNDEAD,0.0f,1);
            }
        }
        break;
        case SPELLABILITY_PM_SUMMON_GREATER_UNDEAD:
        {
            nImpact = VFX_FNF_LOS_EVIL_10;
            nCasterLevel = GetLevelByClass(CLASS_TYPE_PALE_MASTER, oCaster);
            fDuration = GetDuration(14 + nCasterLevel, HOURS);
            if (nCasterLevel >= 30)
            {
                // * Demi Lich
                eSummon = EffectSummonCreature("X2_S_LICH_30",VFX_FNF_SUMMON_EPIC_UNDEAD,0.0f,1);
            }
            else if (nCasterLevel >= 28)
            {
                // * Mega Alhoon
                eSummon = EffectSummonCreature("x2_s_lich_26",VFX_FNF_SUMMON_EPIC_UNDEAD,0.0f,1);
            }
            else if (nCasterLevel >= 26)
            {
                // * Alhoon
                eSummon = EffectSummonCreature("X2_S_LICH_24",VFX_FNF_SUMMON_EPIC_UNDEAD,0.0f,1);
            }
            else if (nCasterLevel >= 24)
            {
                // * Lich
                eSummon = EffectSummonCreature("X2_S_LICH_22",VFX_FNF_SUMMON_EPIC_UNDEAD,0.0f,0);
            }
            else if (nCasterLevel >= 22)
            {
                // * Lich
                eSummon = EffectSummonCreature("X2_S_LICH_20",VFX_FNF_SUMMON_EPIC_UNDEAD,0.0f,0);
            }
            else if (nCasterLevel >= 20)
            {
                // * Skeleton Blackguard
                eSummon = EffectSummonCreature("x2_s_bguard_18",VFX_IMP_HARM,0.0f,0);
            }
            else if (nCasterLevel >= 18)
            {
                // * Vampire Mage
                eSummon = EffectSummonCreature("x2_s_vamp_18",VFX_FNF_SUMMON_UNDEAD,0.0f,1);
            }
            else if (nCasterLevel >= 16)
            {
                // * Ghoul King
                eSummon = EffectSummonCreature("X2_S_GHOUL_16",VFX_IMP_HARM,0.0f,0);
            }
            else if (nCasterLevel >= 14)
            {
                // * Greater Bodak
                eSummon = EffectSummonCreature("X2_S_BODAK_14",VFX_IMP_HARM,0.0f,0);
            }
            else if (nCasterLevel >= 12)
            {
                // * Vampire Rogue
                eSummon = EffectSummonCreature("X2_S_VAMP_10",VFX_FNF_SUMMON_UNDEAD,0.0f,1);
            }
            else if (nCasterLevel >= 10)
            {
                // Specture
                eSummon = EffectSummonCreature("X2_S_SPECTRE_10",VFX_FNF_SUMMON_UNDEAD, 0.0f,1);
            }
            else
            {
                // * Mummy
                eSummon = EffectSummonCreature("X2_S_MUMMY_9",VFX_IMP_HARM, 0.0f,0);
            }
        }
        break;
        case SPELL_CREATE_UNDEAD:
        {
            if (nCasterLevel <= 11)
            {
                eSummon = EffectSummonCreature("NW_S_GHOUL",VFX_FNF_SUMMON_UNDEAD);
            }
            else if ((nCasterLevel >= 12) && (nCasterLevel <= 13))
            {
                eSummon = EffectSummonCreature("NW_S_GHAST",VFX_FNF_SUMMON_UNDEAD);
            }
            else if ((nCasterLevel >= 14) && (nCasterLevel <= 15))
            {
                eSummon = EffectSummonCreature("NW_S_WIGHT",VFX_FNF_SUMMON_UNDEAD);
            }
            else if ((nCasterLevel >= 16))
            {
                eSummon = EffectSummonCreature("NW_S_SPECTRE",VFX_FNF_SUMMON_UNDEAD);
            }
            fDuration = GetDuration(24, ROUNDS);
        }
        break;
        case SPELL_CREATE_GREATER_UNDEAD:
        {
            if (nCasterLevel <= 15)
            {
                eSummon = EffectSummonCreature("NW_S_VAMPIRE",VFX_FNF_SUMMON_UNDEAD);
            }
            else if ((nCasterLevel >= 16) && (nCasterLevel <= 17))
            {
                eSummon = EffectSummonCreature("NW_S_DOOMKGHT",VFX_FNF_SUMMON_UNDEAD);
            }
            else if ((nCasterLevel >= 18) && (nCasterLevel <= 19))
            {
                eSummon = EffectSummonCreature("NW_S_LICH",VFX_FNF_SUMMON_UNDEAD);
            }
            else
            {
                eSummon = EffectSummonCreature("NW_S_MUMCLERIC",VFX_FNF_SUMMON_UNDEAD);
            }
            fDuration = GetDuration(24, ROUNDS);
        }
        break;
        default:
        {
            Debug("[op_s_aoeeffect] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    if (sSpawn != "")
    {
        object oCreature = CreateObject(OBJECT_TYPE_CREATURE, sSpawn, GetSpellTargetLocation());
        DelayCommand(0.5, ApplyVisualEffectAtObjectsLocation(nVis, oCreature));
    }
    else
    {
        // All summon effects are Extraordinary to prevent usual dispel magic. Instead
        // the summon itself can be targeted by dispel magic and may disappear (except level 10 / epic spells).
        eSummon = ExtraordinaryEffect(eSummon);

        if (GetEffectType(eSummon, TRUE) == EFFECT_TYPE_SUMMON_CREATURE)
        {
            ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, lTarget, fDuration);
        }
        else
        {
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eSummon, oTarget, fDuration);
        }
        ApplyVisualEffectAtLocation(nImpact, lTarget);
    }
}
