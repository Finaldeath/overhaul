//::///////////////////////////////////////////////
//:: Polymorph Self
//:: op_s_polyself.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Ranger 4, Wizard / Sorcerer 4
    Innate Level: 4
    School: Transmutation
    Descriptor(s):
    Component(s): Verbal
    Range: Personal
    Area of Effect / Target: Caster
    Duration: 1 Turn / Level
    Additional Counter Spells:
    Save: Harmless
    Spell Resistance: No

    The caster is able to turn himself into one of the following forms:
    Giant spider
    Troll
    Umber hulk
    Pixie
    Zombie
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Determine Polymorph subradial type
    int nPoly;
    switch (nSpellId)
    {
        case 387: nPoly = POLYMORPH_TYPE_GIANT_SPIDER; break;
        case 388: nPoly = POLYMORPH_TYPE_TROLL; break;
        case 389: nPoly = POLYMORPH_TYPE_UMBER_HULK; break;
        case 390: nPoly = POLYMORPH_TYPE_PIXIE; break;
        case 391: nPoly = POLYMORPH_TYPE_ZOMBIE; break;
        default:
        {
            if (DEBUG >= LOG_LEVEL_ERROR) OP_Debug("[ERROR] Polymorph Self Invalid Subspell ID");
            return;
        }
        break;
    }

    effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
    effect ePoly = EffectPolymorph(nPoly);

    float fDuration = GetDuration(nCasterLevel, TURNS);

    // Fire cast spell at event for the specified target
    SignalSpellCastAt(oTarget, oCaster, FALSE);

    // Apply the VFX impact and effects
    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, ePoly, oTarget, fDuration);
}
