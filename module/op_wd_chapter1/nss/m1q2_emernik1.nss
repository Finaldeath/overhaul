//::///////////////////////////////////////////////
//:: m1q2 Emernik (Initial Conversation Action)
//:: m1q2_Emernik1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script moves Emernik into the nearby
    room.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 30, 2001
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetNearestObjectByTag("Emernik_Door");
    object oWaypoint = GetNearestObjectByTag("Emernik_Waypoint");

    ActionMoveToObject(oDoor, TRUE, 1.1);
    ActionOpenDoor(oDoor);
    ActionMoveToObject(oWaypoint, TRUE, 0.1);
}
