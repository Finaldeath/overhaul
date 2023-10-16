//::///////////////////////////////////////////////
//:: Name act_q1hblake_9a
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
    object oBaby = GetLocalObject(GetModule(), "X1Q1BBaby");
    DestroyObject(oBaby);
    if (GetLocalInt(OBJECT_SELF, "X1_BabyRewardGiven") != 1)
    {
        SetLocalInt(OBJECT_SELF, "X1_BabyRewardGiven", 1);
        RewardXP("xplow", 100, GetPCSpeaker());
        AdjustAlignment(GetPCSpeaker(),ALIGNMENT_GOOD, 2);
    }
    SetLocalInt(GetModule(),"X1_NORAHASBABY",1);

}
