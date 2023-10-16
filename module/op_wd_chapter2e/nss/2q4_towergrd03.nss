//::///////////////////////////////////////////////
//:: Open Host Tower Gate
//:: 2Q4_OpenHost
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the diplomatic letter is recieved
    the host tower gate opens and sets the global
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 14, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "NW_I0_HOSTINCL"
void main()
{
    SetLocalInt(GetModule(),"Host_Tower_Bridge_Open",1);
    SetLocalObject(OBJECT_SELF,"Ambassador",GetPCSpeaker());
    //AssignCommand(GetObjectByTag("2Q4A_HostTower"),ActionOpenDoor(OBJECT_SELF));
    object oDoor = GetNearestObjectByTag("2Q4A_HostTower");
    if(GetIsObjectValid(oDoor))
    {
        //SetPlotFlag(oDoor, FALSE);
        //DestroyObject(oDoor,0.2);
        SetLocked(oDoor, FALSE);
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
    }
    RewardXP("M1Q4TowGrd",100, GetPCSpeaker());
}

