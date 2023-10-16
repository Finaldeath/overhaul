//::///////////////////////////////////////////////
//:: Brough in Chief's Head
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: November 2001
//:
//://////////////////////////////////////////////

#include "M3PLOTINCLUDE"
#include "nw_i0_plot"

void main()
{
    int nReward = 0;
    TakeHeadOfCommand(GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL",GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL") + 1);
    SetLocalInt(GetModule(), "NW_G_M3Q02TALKFORTILKARDSIEGE", 1);

    // * GP reward based on charisma
    if (CheckCharismaLow() == TRUE)
    {
        nReward = 1000;
    }
    else
    if (CheckCharismaMiddle() == TRUE)
    {
        nReward = 1200;
    }
    if (CheckCharismaHigh() == TRUE)
    {
        nReward = 1500;
    }

    RewardGP(nReward, GetPCSpeaker());
    RewardXP("M3Q2_A11_DAMAS",50, GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_G_M3Q2A_ZOKANHEAD",1);
}

