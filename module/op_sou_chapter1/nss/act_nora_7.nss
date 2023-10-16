//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Rewards PC full XP and set's that PC lied to Nora.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 24, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    if (GetLocalInt(OBJECT_SELF, "X1_BabyRewardGiven") != 1)
    {
        SetLocalInt(OBJECT_SELF, "X1_BabyRewardGiven", 1);
        RewardXP("xplow",100,GetPCSpeaker());
    }
    SetLocalInt(GetPCSpeaker(),"X1_NORALIEDTO",10);
}
