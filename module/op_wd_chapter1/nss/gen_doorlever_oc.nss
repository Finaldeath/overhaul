//::///////////////////////////////////////////////
//:: Generic Door Lever (Open/Close)
//:: m1q2_DoorLever
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script opens & unlocks the nearest door
    or closes & locks it if it is already open.
    WARNING: Be careful about players locking
    each other into rooms.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 28, 2001
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);
    int iDoorLocked = GetLocked(oDoor);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    if (iDoorLocked == TRUE)
    {
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
        SetLocked(oDoor, FALSE);
    }
    else
    {
        AssignCommand(oDoor, ActionCloseDoor(oDoor));
        SetLocked(oDoor, TRUE);
    }
}
