//::///////////////////////////////////////////////
//:: Generic Door Lever
//:: Gen_DoorLever_O
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script opens and unlocks the nearest
    door.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 21, 2001
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);

    PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    AssignCommand(oDoor, ActionOpenDoor(oDoor));
    SetLocked(oDoor, FALSE);
}
