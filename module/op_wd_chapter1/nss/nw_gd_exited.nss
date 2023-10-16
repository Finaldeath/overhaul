//::///////////////////////////////////////////////
//:: Exited
//:: NW_GD_Exited
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the intruder exits the guarded area, set
    the local object on the nearest guard dog to
    OBJECT_INVALID.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 4, 2002
//:://////////////////////////////////////////////

void main()
{
    object oExited = GetExitingObject();
    object oDog = GetNearestObjectByTag("NW_GD_DOG");

    if (GetLocalObject(oDog,"NW_L_Intruder") == oExited ||
        OBJECT_SELF == oExited)
    {
        SetLocalObject(oDog,"NW_L_Intruder",OBJECT_INVALID);
        SignalEvent(oDog,EventUserDefined(100));
    }
}
