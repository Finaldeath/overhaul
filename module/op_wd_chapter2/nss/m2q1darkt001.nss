//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1DarkT001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Darktongue leaves the Alliance Arms Inn.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////

void CreateMercs()
{
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CDARKTGUARD",GetLocation(GetWaypointByTag("WP_DARKTONGUE2")));
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CDARKTGUARD",GetLocation(GetWaypointByTag("WP_DARKTONGUE3")));
}

void main()
{
    object oDoor = GetObjectByTag("M2Q1B2toM2Q1A");

    ActionForceMoveToObject(oDoor,FALSE,1.9,10.0);
    ActionOpenDoor(oDoor);
    ActionDoCommand(AssignCommand(oDoor,DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF))));
    ActionJumpToObject(GetWaypointByTag("WP_DARKTONGUE"));
    ActionDoCommand(CreateMercs());
    ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_Moved",20));
    ActionDoCommand(SetCommandable(TRUE));
    SetCommandable(FALSE);
}
