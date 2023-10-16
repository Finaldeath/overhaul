//::///////////////////////////////////////////////
//:: m2q3E Silverback Action Script #1
//:: m2q3E_SilverA1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the "WolfSpared" global for Pete O'Deel.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On:Feb 5, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    object oExit = GetWaypointByTag("WP_SIVERBACK_EXIT");

    if (GetLocalInt(GetModule(),"m2q3E_WolfSpared") == 0)
    {
        SetLocalInt(GetModule(), "m2q3E_WolfSpared", TRUE);
        RewardXP("m2q3E_Wolves",100,GetPCSpeaker());
    }
    ActionForceMoveToObject(oExit,TRUE,1.0,10.0);
    DestroyObject(OBJECT_SELF,10.0);
    SetCommandable(FALSE);
}
