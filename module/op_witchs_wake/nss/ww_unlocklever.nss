//::///////////////////////////////////////////////
//:: Witchwork: Door Lever (Unlock/Open)
//:: WW_UnlockLever.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Unlocks & Opens nearest door (or Closes &
     Locks it if it's open).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 17, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);
    int bLocked = GetLocked(oDoor);

    //If door is currently locked...
    if (bLocked == TRUE)
    {
        //Unlock it...
        SetLocked(oDoor, FALSE);
        //...and open it.
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
        //Play Deactivate Animation
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    }
    //If door is currently unlocked...
    else
    {
        //Lock it...
        SetLocked(oDoor, TRUE);
        //...and close it.
        AssignCommand(oDoor, ActionCloseDoor(oDoor));
        //Play Activate Animation
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    }
}
