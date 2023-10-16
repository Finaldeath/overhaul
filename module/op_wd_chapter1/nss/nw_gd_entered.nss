//::///////////////////////////////////////////////
//:: Entered
//:: NW_GD_Entered
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If a PC enters the guarded area, set the local
    object on the nearest guard dog to the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 4, 2002
//:://////////////////////////////////////////////

void main()
{
    object oEntered = GetEnteringObject();
    object oDog = GetNearestObjectByTag("NW_GD_DOG");

    if (GetIsPC(oEntered))
    {
        SetLocalObject(oDog,"NW_L_Intruder",oEntered);
        SignalEvent(oDog,EventUserDefined(100));
    }
}
