//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Cynn's quest is over and she is upset. Reward
     xp
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 15, 2003
//:://////////////////////////////////////////////
#include "inc_plot_locals"
#include "nw_i0_plot"
#include "x2_inc_plot"
void main()
{
    object oPC = GetPCSpeaker();
    CynnsQuestEndedBad(oPC);

    if (GetPCTotalLevel(oPC) < 15)
    {
        Reward_2daXP(oPC, XP_MEDIUM_HIGH, TRUE); //600 xp reward if PC is less than 15th level
    }
    else
    {
        Reward_2daXP(oPC, XP_MEDIUM_LOW, TRUE); //200 xp reward if PC is 15th level or higher

    }
}
