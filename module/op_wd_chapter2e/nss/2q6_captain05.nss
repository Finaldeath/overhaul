//::///////////////////////////////////////////////
//:: Gate Guard Open Door
//:: 2Q6_Captain05
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes the Captain move to a point and open the
    door.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 21, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "NW_I0_HOSTINCL"
void main()
{
    /*
    object oLever = GetObjectByTag("2Q6A_HostLever");
    DelayCommand(2.0,ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
    MoveToPlotPoint(1);
    ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 0.5);
    object oDoor = GetObjectByTag("2Q6A_HostEnter");
    DelayCommand(2.0, AssignCommand(oDoor, ActionOpenDoor(oDoor)));
    SetLocalInt(GetModule(),"2Q6_HostTowerDoor",1);
    HOST_PlayDoorAnimation();
    DelayCommand(5.0, WalkWayPoints());
    */
    object oDoor = GetObjectByTag("2Q6A_HostEnter");
    if(GetIsObjectValid(oDoor))
    {
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
    }
}
