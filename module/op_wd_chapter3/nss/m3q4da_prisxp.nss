//::///////////////////////////////////////////////
//:: M3Q4DA_PRISXP
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Rewards 100 XP for freeing the prisoner.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 3, 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_M3Q4DA_FREE")==0)
    {
        object oPC = GetPCSpeaker();
        SetLocalInt(OBJECT_SELF,"NW_L_M3Q4DA_FREE",10);
        RewardXP("M3Q2_SMALL_REWARDS",100,oPC);
    }
}
