//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set Tanarell to happy, give small xp bonus.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 6, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "x2_inc_plot"

void main()
{
    SetLocalInt(GetModule(),"XP_TANARELLSPEAK",20);

    //Reward only once.
    if (GetLocalInt(OBJECT_SELF, "nRewardPC") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nRewardPC", 1);

    object oPC = GetPCSpeaker();

    GiveXPToCreature(oPC,150);

    if (GetPCTotalLevel(oPC) < 15)
    {
        Reward_2daXP(oPC, XP_MEDIUM_LOW, FALSE); //150 xp reward if PC is less than 15th level
    }
    else
    {
        Reward_2daXP(oPC, XP_VERY_LOW, FALSE); //50 xp reward if PC is 15th level or higher
    }
}
