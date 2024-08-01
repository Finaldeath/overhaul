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

    // If set this will spawn the given creature
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
    }
}
