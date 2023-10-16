//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1a03alhlr_p40
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alhelor leaves the inn and returns home.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 14, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("M2Q1B2toM2Q1A");

    ActionForceMoveToObject(oDoor,FALSE,1.9,10.0);
    ActionOpenDoor(oDoor);
    ActionDoCommand(AssignCommand(oDoor,DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF))));
    ActionJumpToObject(GetWaypointByTag("WP_M2Q1ALHELOR"));
    ActionDoCommand(SetLocalInt(GetModule(),"NW_G_ALHELOR_PLOT",40));
    ActionDoCommand(SetCommandable(TRUE));
    SetCommandable(FALSE);
}
