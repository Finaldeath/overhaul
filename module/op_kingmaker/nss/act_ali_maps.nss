//::///////////////////////////////////////////////
//:: act_ali_maps
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alias opens the area maps to the Keep and drops
    some healing kits int the PC inventory.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Jan 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oSouth = GetObjectByTag("q2b");
    object oNorth = GetObjectByTag("q2c");

    ExploreAreaForPlayer(oSouth,oPC);
    ExploreAreaForPlayer(oNorth,oPC);

    CreateItemOnObject("it_medkit003", oPC, 3);
}
