//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Give half xp to the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 25, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X1_SzarenXPRewarded") != 1)
    {
        SetLocalInt(oPC, "X1_SzarenXPRewarded", 1);
        RewardXP("xplow",50,oPC);
    }
}
