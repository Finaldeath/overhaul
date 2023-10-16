//::///////////////////////////////////////////////
//:: Brazier Setup
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the Brazier up to react to a specific
    reagent, spell combination.

    Remember a book should be written explaining
    how to safely activate the ritual.
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  December
//:://////////////////////////////////////////////

void main()
{
    // * Put resref/tag of reagent here (Fire Beetle's Belly)
    SetLocalString(OBJECT_SELF, "NW_J_REAGENT", "NW_IT_MSMLMISC08");

    // * Put spell ID to activate circle here
    SetLocalInt(OBJECT_SELF, "NW_J_SPELLID", SPELL_BURNING_HANDS);

    // * Put creature resref/tag here
    SetLocalString(OBJECT_SELF, "NW_J_CREATURERESREF", "M2Q3I_BELIAL");

    // * specify tag name of waypoint where demon should appear
    SetLocalString(OBJECT_SELF, "NW_J_CREATURELOC", "m2q3I_SummonTarget");

    // * Specify the POWERFUL MAGIC ITEM that the demon gives (Robe of Fire Resistance)
    SetLocalString(OBJECT_SELF,"NW_J_DEMON_REWARDITEM","NW_MCLOTH009");

}
