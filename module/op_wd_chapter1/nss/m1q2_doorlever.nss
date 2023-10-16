//::///////////////////////////////////////////////
//:: Generic Door Lever
//:: m1q2_DoorLever
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script opens the nearest door. It has
    been used on generic levers throughout the
    prison in m1q2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 21, 2001
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);

    AssignCommand(oDoor, ActionOpenDoor(oDoor));
    SetLocked(oDoor, FALSE);
}
