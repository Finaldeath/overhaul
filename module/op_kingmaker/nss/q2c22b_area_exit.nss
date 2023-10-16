//::///////////////////////////////////////////////
//:: q2c22b_area_exit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On exit, the candelabra stops following the player around
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oCandle = GetObjectByTag("q2_candelabra");
    object oPC = GetFirstPC();
    if(GetExitingObject()==oPC && GetIsObjectValid(oCandle))
    {
        SetLocalObject(oCandle,"OS_PC_CANDELABRA",OBJECT_INVALID);
        event eFollow = EventUserDefined(307);
        SignalEvent(oCandle,eFollow);
        //stops the candelabra following the player around
    }
}
