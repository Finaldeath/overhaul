//::///////////////////////////////////////////////
//:: Name q2bn_drowtrig1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
      door - q2bn_drowdoor1
      drow - q2bn_drowrogue1
      waypoint - wp_q2bn_drowpatrol1

      When a PC crosses the trigger - open the door
      and have the drow walk out (on patrol) - on
      attacked - the drow will run back to his room
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 18/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        object oDoor = GetObjectByTag("q2bn_drowdoor1");
        object oDrow = GetObjectByTag("q2bn_drowrogue1");
        object oWaypoint = GetWaypointByTag("wp_q2bn_drowpatrol1");

        AssignCommand(oDoor, ActionOpenDoor(oDoor));
        AssignCommand(oDrow, ActionMoveToLocation(GetLocation(oWaypoint)));
    }
}
