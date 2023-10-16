//::///////////////////////////////////////////////
//:: Conversation
//:: m1s4EnterArena
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Transports the PC into the arena with the
    appropriate challenger.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 30, 2001
//:://////////////////////////////////////////////

void main()
{
    if (GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M1S04IBADGELVL03")))
    {
        SetLocalInt(GetModule(),"NW_G_M1S4ArenaLevel",4);
        DestroyObject(GetItemPossessedBy(GetLastSpeaker(),"M1S04IBADGELVL03"));
        CreateObject(OBJECT_TYPE_CREATURE,"M1S04CCLAUDUS02",GetLocation(GetWaypointByTag("M1S4ARENACHLNGR")));
    }
    else if (GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M1S04IBADGELVL02")))
    {
        SetLocalInt(GetModule(),"NW_G_M1S4ArenaLevel",3);
        DestroyObject(GetItemPossessedBy(GetLastSpeaker(),"M1S04IBADGELVL02"));
        CreateObject(OBJECT_TYPE_CREATURE,"M1S04CAGAR02",GetLocation(GetWaypointByTag("M1S4ARENACHLNGR")));
    }
    else if (GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M1S04IBADGELVL01")))
    {
        SetLocalInt(GetModule(),"NW_G_M1S4ArenaLevel",2);
        DestroyObject(GetItemPossessedBy(GetLastSpeaker(),"M1S04IBADGELVL01"));
        CreateObject(OBJECT_TYPE_CREATURE,"M1S04CFASHI02",GetLocation(GetWaypointByTag("M1S4ARENACHLNGR")));
    }
    else
    {
        SetLocalInt(GetModule(),"NW_G_M1S4ArenaLevel",1);
        CreateObject(OBJECT_TYPE_CREATURE,"M1S04CHRUSK02",GetLocation(GetWaypointByTag("M1S4ARENACHLNGR")));
    }
    AssignCommand(GetLastSpeaker(),JumpToLocation(GetLocation(GetWaypointByTag("M1S4ARENAENTER"))));
}
