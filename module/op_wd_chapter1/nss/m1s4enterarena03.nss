//::///////////////////////////////////////////////
//:: Conversation
//:: m1s4EnterArena03
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Transports the PC into the arena level 1 with
    Agar.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 30, 2001
//:://////////////////////////////////////////////

void main()
{
    location lLoc = GetLocation(GetWaypointByTag("M1S4ARENACHLNG03"));
    SetLocalInt(GetModule(),"NW_G_Map_M1S4E_Occupied",TRUE);
    DestroyObject(GetItemPossessedBy(GetPCSpeaker(),"M1S04IBADGELVL02"));
    CreateObject(OBJECT_TYPE_CREATURE,"M1S04CAGAR02",lLoc);
    CreateObject(OBJECT_TYPE_CREATURE,"nw_cragcat001",lLoc);
    AssignCommand(GetPCSpeaker(),JumpToLocation(GetLocation(GetWaypointByTag("M1S4ARENALV03"))));
}
