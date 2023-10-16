//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Rewards player with gold and xp, sets local that
    a PC has been rewarded for this info.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan WHiteside
//:: Created On: Dec 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"
#include "x2_inc_plot"
void main()
{
    object oPC = GetPCSpeaker();
    GiveGoldToCreature(oPC,1000);
    if (GetPCTotalLevel(oPC) < 15)
    {
        Reward_2daXP(oPC, 12, TRUE); //600 xp reward if PC is less than 15th level
    }
    else
    {
        Reward_2daXP(oPC, 11, TRUE); //200 xp reward if PC is 15th level or higher

    }
    SetLocalInt(GetModule(),"TELLDOFSPIDERS",10);
}
