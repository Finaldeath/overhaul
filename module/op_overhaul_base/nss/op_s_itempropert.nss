//::///////////////////////////////////////////////
//:: Item Property spells
//:: op_s_itempropert
//:://////////////////////////////////////////////
/*
    Basic item property spells. There are some spells (Bless, Flame Arrow) that
    do affect items and add properties which can be funneled in here instead.

    What do we do about stacking of item properties? Do we just remove all existing
    temporary item properties? That might be the best idea to be honest. Bioware
    used IPSafeAddItemProperty() usually with X2_IP_ADDPROP_POLICY_REPLACE_EXISTING
    which is "remove any property of the same type, subtype, durationtype before
    adding".

    I'd say we want to do this:
    * Have a check function, and check if one of a given set of properties are
      present
    * If the properties need to override them, we remove the existing ones at
      the same time


    Dispel Magic
    We can track the item properties and use an EffectRunScript to clear them
    if dispel magic used. But what happens if the items are removed from the
    creatures inventory? Unlike Magic Fang applied to creature weapons, this is
    pretty common and is even a game mechanic (ie disarm feat). If we moved
    to tracking the items themselves that is doable but is a little unfair if
    we have to dispel magic every creature weapon (for instance).

    Possibilties:
    * We actually do just track item properties, but we can tie them together
      with a spell Id and so if one is removed, all are removed.
    * Area of Effect Dispels don't affect items anyway so we don't need to worry
      about EffectDispelMagicBest.




*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;


}

