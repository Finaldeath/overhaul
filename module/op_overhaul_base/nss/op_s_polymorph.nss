//:://////////////////////////////////////////////
//:: Polymorph
//:: op_s_polymorph
//:://////////////////////////////////////////////
/*
    This can cover most of the Polymorph spells and abilities so we can tag in
    additional benefits if we have feats/stuff relating to it.

    Polymorph
    The caster is able to turn himself into one of the following forms:
    Giant Spider, Troll, Umber Hulk, Pixie, Zombie

    Shapechange
    Red Dragon, Fire Giant, Balor, Death Slaad, Iron Golem
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_polymorph"

void main()
{
    if (DoSpellHook()) return;

    // Duration is caster level OR the druid level
    int nDruidLevels = GetLevelByClass(CLASS_TYPE_DRUID);
    int nShifterLevels = GetLevelByClass(CLASS_TYPE_SHIFTER);

    // Determine Polymorph subradial type
    int nPoly;
    int nDurationType = MINUTES;
    switch (nSpellId)
    {
        // Spells
        case SPELL_POLYMORPH_SELF_GIANT_SPIDER: nPoly = POLYMORPH_TYPE_GIANT_SPIDER; break;
        case SPELL_POLYMORPH_SELF_TROLL: nPoly = POLYMORPH_TYPE_TROLL; break;
        case SPELL_POLYMORPH_SELF_UMBER_HULK: nPoly = POLYMORPH_TYPE_UMBER_HULK; break;
        case SPELL_POLYMORPH_SELF_FEY: nPoly = POLYMORPH_TYPE_PIXIE; break;
        case SPELL_POLYMORPH_SELF_ZOMBIE: nPoly = POLYMORPH_TYPE_ZOMBIE; break;
        case SPELL_SHAPECHANGE_BALOR: nPoly = POLYMORPH_TYPE_BALOR; break;
        case SPELL_SHAPECHANGE_DEATH_SLAAD: nPoly = POLYMORPH_TYPE_DEATH_SLAAD; break;
        case SPELL_SHAPECHANGE_FIRE_GIANT: nPoly = POLYMORPH_TYPE_UMBER_HULK; break;
        case SPELL_SHAPECHANGE_IRON_GOLEM: nPoly = POLYMORPH_TYPE_IRON_GOLEM; break;
        case SPELL_SHAPECHANGE_RED_DRAGON: nPoly = POLYMORPH_TYPE_RED_DRAGON; break;
        // Druid Wildshape
        case SPELLABILITY_WILD_SHAPE_BROWN_BEAR: nDurationType = HOURS; nCasterLevel = nDruidLevels; nPoly = nDruidLevels >= 12 ? POLYMORPH_TYPE_DIRE_BROWN_BEAR : POLYMORPH_TYPE_BROWN_BEAR; break;
        case SPELLABILITY_WILD_SHAPE_PANTHER:    nDurationType = HOURS; nCasterLevel = nDruidLevels; nPoly = nDruidLevels >= 12 ? POLYMORPH_TYPE_DIRE_PANTHER : POLYMORPH_TYPE_PANTHER; break;
        case SPELLABILITY_WILD_SHAPE_WOLF:       nDurationType = HOURS; nCasterLevel = nDruidLevels; nPoly = nDruidLevels >= 12 ? POLYMORPH_TYPE_DIRE_WOLF : POLYMORPH_TYPE_WOLF; break;
        case SPELLABILITY_WILD_SHAPE_BOAR:       nDurationType = HOURS; nCasterLevel = nDruidLevels; nPoly = nDruidLevels >= 12 ? POLYMORPH_TYPE_DIRE_BOAR : POLYMORPH_TYPE_BOAR; break;
        case SPELLABILITY_WILD_SHAPE_BADGER:     nDurationType = HOURS; nCasterLevel = nDruidLevels; nPoly = nDruidLevels >= 12 ? POLYMORPH_TYPE_DIRE_BADGER : POLYMORPH_TYPE_BADGER; break;
        // Druid Elemental Shape
        case SPELLABILITY_ELEMENTAL_SHAPE_FIRE:  nDurationType = HOURS; nCasterLevel = nDruidLevels; nPoly = nDruidLevels >= 20 ? POLYMORPH_TYPE_ELDER_FIRE_ELEMENTAL : POLYMORPH_TYPE_HUGE_FIRE_ELEMENTAL; break;
        case SPELLABILITY_ELEMENTAL_SHAPE_WATER: nDurationType = HOURS; nCasterLevel = nDruidLevels; nPoly = nDruidLevels >= 20 ? POLYMORPH_TYPE_ELDER_WATER_ELEMENTAL : POLYMORPH_TYPE_HUGE_WATER_ELEMENTAL; break;
        case SPELLABILITY_ELEMENTAL_SHAPE_EARTH: nDurationType = HOURS; nCasterLevel = nDruidLevels; nPoly = nDruidLevels >= 20 ? POLYMORPH_TYPE_ELDER_EARTH_ELEMENTAL : POLYMORPH_TYPE_HUGE_EARTH_ELEMENTAL; break;
        case SPELLABILITY_ELEMENTAL_SHAPE_AIR:   nDurationType = HOURS; nCasterLevel = nDruidLevels; nPoly = nDruidLevels >= 20 ? POLYMORPH_TYPE_ELDER_AIR_ELEMENTAL : POLYMORPH_TYPE_HUGE_AIR_ELEMENTAL; break;
        // Shifter Greater Wildshape I
        case SPELLABILITY_GREATER_WILDSHAPE_I_WYRMLING_RED:   nPoly = POLYMORPH_TYPE_WYRMLING_RED; break;
        case SPELLABILITY_GREATER_WILDSHAPE_I_WYRMLING_BLUE:  nPoly = POLYMORPH_TYPE_WYRMLING_BLUE; break;
        case SPELLABILITY_GREATER_WILDSHAPE_I_WYRMLING_BLACK: nPoly = POLYMORPH_TYPE_WYRMLING_BLACK; break;
        case SPELLABILITY_GREATER_WILDSHAPE_I_WYRMLING_WHITE: nPoly = POLYMORPH_TYPE_WYRMLING_WHITE; break;
        case SPELLABILITY_GREATER_WILDSHAPE_I_WYRMLING_GREEN: nPoly = POLYMORPH_TYPE_WYRMLING_GREEN; break;
        // Shifter Greater Wildshape II
        case SPELLABILITY_GREATER_WILDSHAPE_II_GARGOYLE: nPoly = nShifterLevels <= 10 ? POLYMORPH_TYPE_GARGOYLE : POLYMORPH_TYPE_GARGOYLE_EPIC; break;
        case SPELLABILITY_GREATER_WILDSHAPE_II_HARPY:    nPoly = nShifterLevels <= 10 ? POLYMORPH_TYPE_HARPY : POLYMORPH_TYPE_HARPY_EPIC; break;
        case SPELLABILITY_GREATER_WILDSHAPE_II_MINOTAUR: nPoly = nShifterLevels <= 10 ? POLYMORPH_TYPE_MINOTAUR : POLYMORPH_TYPE_MINOTAUR_EPIC; break;
        // Shifter Greater Wildshape III
        case SPELLABILITY_GREATER_WILDSHAPE_III_BASILISK:  nPoly = nShifterLevels <= 10 ? POLYMORPH_TYPE_BASILISK : POLYMORPH_TYPE_BASILISK_EPIC; break;
        case SPELLABILITY_GREATER_WILDSHAPE_III_DRIDER:    nPoly = nShifterLevels <= 10 ? POLYMORPH_TYPE_DRIDER : POLYMORPH_TYPE_DRIDER_EPIC; break;
        case SPELLABILITY_GREATER_WILDSHAPE_III_MANTICORE: nPoly = nShifterLevels <= 10 ? POLYMORPH_TYPE_MANTICORE : POLYMORPH_TYPE_MANTICORE_EPIC; break;
        // Shifter Greater Wildshape IV
        case SPELLABILITY_GREATER_WILDSHAPE_IV_MEDUSA:     nPoly = POLYMORPH_TYPE_MEDUSA; break;
        case SPELLABILITY_GREATER_WILDSHAPE_IV_MINDFLAYER: nPoly = POLYMORPH_TYPE_MINDFLAYER; break;
        case SPELLABILITY_GREATER_WILDSHAPE_IV_DIRE_TIGER: nPoly = POLYMORPH_TYPE_DIRETIGER; break;
        // Shifter Humanoid Shape
        case SPELLABILITY_HUMANOID_SHAPE_DROW:
        {
            if (GetGender(oTarget) == GENDER_FEMALE) { nPoly = nShifterLevels <= 16 ? POLYMORPH_TYPE_FEMALE_DROW : POLYMORPH_TYPE_FEMALE_DROW_EPIC; }
            else                                     { nPoly = nShifterLevels <= 16 ? POLYMORPH_TYPE_MALE_DROW : POLYMORPH_TYPE_MALE_DROW_EPIC; }
        }
        break;
        case SPELLABILITY_HUMANOID_SHAPE_KOBOLD_ASSASSIN: nPoly = nShifterLevels <= 16 ? POLYMORPH_TYPE_KOBOLD_ASSASSIN : POLYMORPH_TYPE_KOBOLD_ASSASSIN_EPIC; break;
        case SPELLABILITY_HUMANOID_SHAPE_LIZARDFOLK:      nPoly = nShifterLevels <= 16 ? POLYMORPH_TYPE_LIZARDFOLK : POLYMORPH_TYPE_LIZARDFOLK_EPIC; break;
        // Shifter Undead Shape
        case SPELLABILITY_UNDEAD_SHAPE_VAMPIRE:
        {
            if (GetGender(oTarget) == GENDER_FEMALE) { nPoly = POLYMORPH_TYPE_VAMPIRE_FEMALE; }
            else                                     { nPoly = POLYMORPH_TYPE_VAMPIRE_MALE; }
        }
        break;
        case SPELLABILITY_UNDEAD_SHAPE_RISEN_LORD: nPoly = POLYMORPH_TYPE_RISEN_LORD; break;
        case SPELLABILITY_UNDEAD_SHAPE_SPECTRE:    nPoly = POLYMORPH_TYPE_SPECTRE; break;
        // Shifter Dragon Shape
        case SPELLABILITY_DRAGON_SHAPE_BLUE_DRAGON:  nPoly = POLYMORPH_TYPE_ANCIENT_BLUE_DRAGON; break;
        case SPELLABILITY_DRAGON_SHAPE_GREEN_DRAGON: nPoly = POLYMORPH_TYPE_ANCIENT_GREEN_DRAGON; break;
        case SPELLABILITY_DRAGON_SHAPE_RED_DRAGON:   nPoly = POLYMORPH_TYPE_ANCIENT_RED_DRAGON; break;
        // Shifter Outsider Shape
        case SPELLABILITY_OUTSIDER_SHAPE_AZER_CHIEFTAIN:
        {
            if (GetGender(oTarget) == GENDER_FEMALE) { nPoly = POLYMORPH_TYPE_AZER_BOSS_FEMALE; }
            else                                     { nPoly = POLYMORPH_TYPE_AZER_BOSS_MALE; }
        }
        break;
        case SPELLABILITY_OUTSIDER_SHAPE_RAKSHASA:
        {
            if (GetGender(oTarget) == GENDER_FEMALE) { nPoly = POLYMORPH_TYPE_RAKSHASA_FEMALE; }
            else                                     { nPoly = POLYMORPH_TYPE_RAKSHASA_MALE; }
        }
        break;
        case SPELLABILITY_OUTSIDER_SHAPE_DEATH_SLAAD: nPoly = POLYMORPH_TYPE_DEATHSLAAD_OUTSIDER_SHAPE; break;
        // Shifter Construct Shape
        case SPELLABILITY_CONSTRUCT_SHAPE_DEMONFLESH_GOLEM: nPoly = POLYMORPH_TYPE_DEMONFLESH_GOLEM; break;
        case SPELLABILITY_CONSTRUCT_SHAPE_IRON_GOLEM:       nPoly = POLYMORPH_TYPE_IRON_GOLEM_CONSTRUCT_SHAPE; break;
        case SPELLABILITY_CONSTRUCT_SHAPE_STONE_GOLEM:      nPoly = POLYMORPH_TYPE_STONE_GOLEM; break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    // Fire cast spell at event for the specified target
    SignalSpellCastAt();

    ApplyVisualEffectToObject(VFX_IMP_POLYMORPH, oTarget);

    // If this is a normal magic spell we just apply as a magical effect now
    if (GetSpellType(nSpellId) == SPELL_TYPE_SPELL)
    {
        float fDuration = GetDuration(nCasterLevel, nDurationType);
        // Apply the VFX impact and effects
        effect ePoly = EffectPolymorph(nPoly);
        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, ePoly, oTarget, fDuration);
    }
    else
    {
        // For things which are not spells we apply them as if shifter merging is enabled
        // This makes the effect extraordinary
        ApplyPolymorphAndItemMerging(oTarget, nPoly);
    }
}
