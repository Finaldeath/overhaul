//::///////////////////////////////////////////////
//:: m1q2 Commoner Escort Alignment Reward
//:: m1q2_EscortAlign
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Provides a small alignment shift towards
    Good to the nearest PC. It occurs when the
    player escorts them within sight of the
    District gates.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 29, 2001
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oPC = GetLocalObject(OBJECT_SELF, "M1Q2AFollowTarget");
    object oDoor = GetNearestObjectByTag("M1Q2A_M1Q1A");

    AutoAlignG(DC_EASY, oPC);
    if(GetLocalInt(OBJECT_SELF,"NW_L_M1Q2RewardGiven") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_M1Q2RewardGiven",TRUE);
        RewardXP("m1q2_PrisonBreak",25,oPC,ALIGNMENT_GOOD,TRUE);
    }
    SetLocalObject(OBJECT_SELF, "M1Q2AFollowTarget",OBJECT_INVALID);
    ActionForceMoveToObject(oDoor);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
