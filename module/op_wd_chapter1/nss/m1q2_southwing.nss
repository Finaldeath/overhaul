//::///////////////////////////////////////////////
//:: m1q2B South Wing Lever
//:: m1q2_SouthWing
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script opens the prison cells on the
    South Wing of m1q2B
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 21, 2001
//:://////////////////////////////////////////////

void main()
{
    int iDoorNumber = 1;
    object oCurrentDoor = GetNearestObjectByTag("m1q2_SouthDoor", OBJECT_SELF ,iDoorNumber);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    ActionStartConversation(OBJECT_SELF);

    while(oCurrentDoor != OBJECT_INVALID)
    {
        AssignCommand(oCurrentDoor, ActionOpenDoor(oCurrentDoor));
        SetLocked(oCurrentDoor, FALSE);
        iDoorNumber++;
        oCurrentDoor = GetNearestObjectByTag("m1q2_SouthDoor", OBJECT_SELF ,iDoorNumber);
    }
}
