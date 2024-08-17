//::///////////////////////////////////////////////
//:: Polymorph
//:: op_s_polymorph.nss
//:://////////////////////////////////////////////
/*
    This can cover most of the Polymorph spells so we can tag in additional
    benefits if we have feats/stuff relating to it.

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

void main()
{
    if (DoSpellHook()) return;

    // Determine Polymorph subradial type
    int nPoly;
    switch (nSpellId)
    {
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
        default:
        {
            Debug("[op_s_polymorph] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    effect eVis  = EffectVisualEffect(VFX_IMP_POLYMORPH);
    effect ePoly = EffectPolymorph(nPoly);

    float fDuration = GetDuration(nCasterLevel, MINUTES);

    // Fire cast spell at event for the specified target
    SignalSpellCastAt();

    // Apply the VFX impact and effects
    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, ePoly, oTarget, fDuration);
}
