//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6SurreyReward
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC receives a small good alignment shift.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 14, 2001
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_Reward") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Reward",10);
        AutoAlignG(DC_EASY, GetPCSpeaker());
    }
}
