//::///////////////////////////////////////////////
//:: Conversation
//:: m1s4EnterArena01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Transports the PC into the arena level 1 with
    Hrusk.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 30, 2001
//:://////////////////////////////////////////////

void main()
{
    location lLoc = GetLocation(GetWaypointByTag("M1S4ARENACHLNG01"));
    SetLocalInt(GetModule(),"NW_G_Map_M1S4C_Occupied",TRUE);
    CreateObject(OBJECT_TYPE_CREATURE,"M1S04CHRUSK02",lLoc);
    CreateObject(OBJECT_TYPE_CREATURE,"nw_dog003",lLoc);
    AssignCommand(GetPCSpeaker(),JumpToLocation(GetLocation(GetWaypointByTag("M1S4ARENALV01"))));
}
