//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Reward PC XP and Gold and
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Dec 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"
#include "x2_inc_plot"
void main()
{
    object oPC = GetPCSpeaker();
    GiveGoldToCreature(oPC,2000);
    if (GetPCTotalLevel(oPC) < 15)
    {
        Reward_2daXP(oPC, 12, TRUE); //600 xp reward if PC is less than 15th level
    }
    else
    {
        Reward_2daXP(oPC, 11, TRUE); //200 xp reward if PC is 15th level or higher

    }

}
