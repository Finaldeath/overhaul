//::///////////////////////////////////////////////
//:: Polymorph
//:: op_s_polymorph.nss
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

#include "op_i_spells"
#include "op_i_polymorph"

void main()
{
    if (DoSpellHook()) return;

    // Duration is caster level OR the druid level
    int nDruidLevels = GetLevelByClass(CLASS_TYPE_DRUID);

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
        // Shifter Shapechange
        default:
        {
            Debug("[op_s_polymorph] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    effect eVis  = EffectVisualEffect(VFX_IMP_POLYMORPH);
    effect ePoly = EffectPolymorph(nPoly);

    // Work out the bonus effects to apply (new way to do item merging
    //effect eLink = GetPolymorph

    float fDuration = GetDuration(nCasterLevel, nDurationType);

    // Fire cast spell at event for the specified target
    SignalSpellCastAt();

    // Apply the VFX impact and effects
    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, ePoly, oTarget, fDuration);
}
