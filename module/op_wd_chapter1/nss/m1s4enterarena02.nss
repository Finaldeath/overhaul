//::///////////////////////////////////////////////
//:: Conversation
//:: m1s4EnterArena02
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Transports the PC into the arena level 2 with
    Fashi.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 30, 2001
//:://////////////////////////////////////////////

void main()
{
    location lLoc = GetLocation(GetWaypointByTag("M1S4ARENACHLNG02"));
    SetLocalInt(GetModule(),"NW_G_Map_M1S4D_Occupied",TRUE);
    DestroyObject(GetItemPossessedBy(GetPCSpeaker(),"M1S04IBADGELVL01"));
    CreateObject(OBJECT_TYPE_CREATURE,"M1S04CFASHI02",lLoc);
    CreateObject(OBJECT_TYPE_CREATURE,"nw_wolf001",lLoc);
    AssignCommand(GetPCSpeaker(),JumpToLocation(GetLocation(GetWaypointByTag("M1S4ARENALV02"))));
}
