//:://////////////////////////////////////////////
//:: Check for Haste and clean
//:: op_rs_checkhaste
//:://////////////////////////////////////////////
/*
    Checks for haste, if we have it, remove this spell Ids effects.
    Should be just an interval script.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (GetHasEffectOrItemProperty(OBJECT_SELF, EFFECT_TYPE_HASTE, ITEM_PROPERTY_HASTE))
    {
        RemoveEffectsFromSpell(OBJECT_SELF, nSpellId);
    }
}
