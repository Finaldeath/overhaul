//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets a local that PC answered the bonus riddle
     correctly and give 25% XP.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb. 03, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC,"X1_RIISIRIDDLE",10);
    if (GetLocalInt(oPC, "X1_RIDDLEONEREWARD") != 1)
    {
        SetLocalInt(oPC, "X1_RIDDLEONEREWARD", 1);
        RewardXP("xplow",25,oPC);
    }
}
