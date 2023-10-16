void main()
{
    location lLoc = GetLocation(GetWaypointByTag("M1S4ARENACHLNG04"));
    SetLocalInt(GetModule(),"NW_G_Map_M1S4E_Occupied",TRUE);
    DestroyObject(GetItemPossessedBy(GetLastSpeaker(),"M1S04IBADGELVL03"));
    CreateObject(OBJECT_TYPE_CREATURE,"M1S04CCLAUDUS02",lLoc);
    CreateObject(OBJECT_TYPE_CREATURE,"nw_panther001",lLoc);
    CreateObject(OBJECT_TYPE_CREATURE,"nw_panther001",lLoc);
    AssignCommand(GetPCSpeaker(),JumpToLocation(GetLocation(GetWaypointByTag("M1S4ARENALV04"))));
}

