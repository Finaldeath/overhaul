//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1WanevLeave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Wanev leaves the Alliance Arms Inn.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("M2Q1B2toM2Q1A");

    ActionMoveToObject(oDoor,FALSE,1.9);
    ActionOpenDoor(oDoor);
    ActionDoCommand(AssignCommand(oDoor,DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF))));
    ActionJumpToObject(GetWaypointByTag("WP_WANEV"));
    ActionDoCommand(SetCommandable(TRUE));
    SetCommandable(FALSE);
}
