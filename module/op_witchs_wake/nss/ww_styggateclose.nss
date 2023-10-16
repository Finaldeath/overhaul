//::///////////////////////////////////////////////
//:: Witchwork: Stygia Gate Closer
//:: WW_StygGateClose.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Close & lock the nearest Stygia gate when a
     PC exits the trigger area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 24, 2002
//:://////////////////////////////////////////////

void main()
{
    object oExiter = GetExitingObject();
    object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);

    //Only pay attention to players.
    if (GetIsPC(oExiter) == TRUE)
    {
        //Lock and close the door.
        SetLocked(oDoor, TRUE);
        AssignCommand(oDoor, ActionCloseDoor(oDoor));
    }
}
