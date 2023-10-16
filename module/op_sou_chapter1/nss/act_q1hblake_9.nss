//::///////////////////////////////////////////////
//:: Name act_q1hblake_9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Take the baby from the PC and reward
        quest experience
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Feb 12/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    DestroyObject(GetItemPossessedBy(GetPCSpeaker(), "q1hbaby"));
    if (GetLocalInt(OBJECT_SELF, "X1_BabyRewardGiven") != 1)
    {
        SetLocalInt(OBJECT_SELF, "X1_BabyRewardGiven", 1);
        RewardXP("xplow", 100, GetPCSpeaker());
    }
    AdjustAlignment(GetPCSpeaker(),ALIGNMENT_GOOD, 2);
    SetLocalInt(GetModule(), "X1_BLAKEHASBABY", 1);
    SetLocalInt(GetModule(),"X1_NORAHASBABY",1);
    SetLocalInt(OBJECT_SELF, "nFollow", 0);
}
