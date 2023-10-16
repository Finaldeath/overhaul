//::///////////////////////////////////////////////
//:: Conversation
//:: m1s4EnterArena04
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Transports the PC into the arena level 4 with
    Claudus.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 30, 2001
//:://////////////////////////////////////////////

void main()
{
    location lLoc = GetLocation(GetWaypointByTag("M1S4ARENACHLNG04"));
    SetLocalInt(GetModule(),"NW_G_Map_M1S4F_Occupied",TRUE);
    DestroyObject(GetItemPossessedBy(GetPCSpeaker(),"M1S04IBADGELVL03"));
    CreateObject(OBJECT_TYPE_CREATURE,"M1S04CCLAUDUS03",lLoc);
    CreateObject(OBJECT_TYPE_CREATURE,"nw_panther001",lLoc);
    CreateObject(OBJECT_TYPE_CREATURE,"nw_panther001",lLoc);
    AssignCommand(GetPCSpeaker(),JumpToLocation(GetLocation(GetWaypointByTag("M1S4ARENALV04"))));
}
