//::///////////////////////////////////////////////
//:: Water Pool Setup
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
    // * Put resref/tag of reagent here
    // * Slaad Tongue
    SetLocalString(OBJECT_SELF, "NW_J_REAGENT", "NW_IT_MSMLMISC10");
    // * Put spell ID to activate circle here
    // * Melf's Acid Arrow
    SetLocalInt(OBJECT_SELF, "NW_J_SPELLID",SPELL_MELFS_ACID_ARROW);

    // * Put creature resref/tag here
    SetLocalString(OBJECT_SELF, "NW_J_CREATURERESREF","M3Q3B_SUMM_WATER");

    // * specify tag name of waypoint where demon should appearn
    SetLocalString(OBJECT_SELF, "NW_J_CREATURELOC", "M3Q2BWATER1LOC");

    // * Specify the POWERFUL MAGIC ITEM that the demon gives
    SetLocalString(OBJECT_SELF,"NW_J_DEMON_REWARDITEM","NW_IT_MRING003");

}
