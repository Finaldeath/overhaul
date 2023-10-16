//::///////////////////////////////////////////////
//:: Londa Dies
//:: 2Q4_Londa19.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script causes Londa to leave the inn and
    then it spawns in a dead body and two
    wererats who are standing over her.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 27, 2002
//:://////////////////////////////////////////////

// **** PLACEHOLDER ****
// Londa must run (not walk) to the door of the inn and disappear
// spawn in Londa immediately outside the inn, dead in the street
// two of Baram's men will be over her, one displaying text over his head
// "Insane woman! She flew at me like a mad harpy! What was she thinking?"

#include "NW_I0_2Q4LUSKAN"
void main()
{
    SetLocalInt(GetModule(),"Londa_Plot",100);
    //Move and destroy londa.
    MoveTo2Q4PlotPoint(1);
    /*
    ActionDoCommand(DestroyObject(OBJECT_SELF, 1.0));

    //Spawn wererats.
    location lKill01 = GetLocation(GetWaypointByTag("2Q4_Londa01"));
    location lKill02 = GetLocation(GetWaypointByTag("2Q4_Londa02"));
    location lBody = GetLocation(GetWaypointByTag("2Q4_LondaDead"));
    CreateObject(OBJECT_TYPE_CREATURE, "2Q4_LondaKill02", lKill01);
    CreateObject(OBJECT_TYPE_CREATURE, "2Q4_LondaKiller", lKill02);
    CreateObject(OBJECT_TYPE_PLACEABLE, "2Q4_LondaDead", lBody);
    */
}
