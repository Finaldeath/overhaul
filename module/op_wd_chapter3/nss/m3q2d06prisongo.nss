//::///////////////////////////////////////////////
//:: Prisoner Leaves
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  December, 2001
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "nw_i0_plot"

void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_G_M3Q2D_PRISONFREE")==0)
    {
        RewardXP("M3Q2_SMALL_REWARDS",100, GetPCSpeaker());
        SetLocalInt(OBJECT_SELF,"NW_G_M3Q2D_PRISONFREE",1);
    }
    SetSpawnInCondition(NW_FLAG_ESCAPE_LEAVE);
    ActivateFleeToExit();
}
