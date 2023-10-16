//::///////////////////////////////////////////////
//:: Bret gives Reward
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Bret gives player XP reward.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "M3PLOTINCLUDE"
void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_G_CHARLOTTESAFE")==0)
    {
        RewardXP("M3Q2_A10_BRET", 50, GetPCSpeaker());
        SetLocalInt(OBJECT_SELF,"NW_G_CHARLOTTESAFE",1);
    }
}
