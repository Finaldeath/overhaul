//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give 25% XP.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb. 03, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X1_RIDDLETHREEREWARD") != 1)
    {
        SetLocalInt(oPC, "X1_RIDDLETHREEREWARD", 1);
        RewardXP("xplow",25,oPC);
    }
}
