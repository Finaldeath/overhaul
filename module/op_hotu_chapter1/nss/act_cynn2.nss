//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Cynn's quest is over and she is happy. Reward
     xp.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 14, 2003
//:://////////////////////////////////////////////
#include "inc_plot_locals"
#include "nw_i0_plot"
#include "x2_inc_plot"
void main()
{
    object oPC = GetPCSpeaker();
    SolveCynnsQuestGood();
    if (GetPCTotalLevel(oPC) < 15)
    {
        Reward_2daXP(oPC, 12, TRUE);
    }
    else
    {
        Reward_2daXP(oPC, XP_MEDIUM, TRUE);

    }
}
