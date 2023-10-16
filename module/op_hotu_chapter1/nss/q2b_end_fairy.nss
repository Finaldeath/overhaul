//::///////////////////////////////////////////////
//:: Name q2b_end_fairy
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Fairy Queen has agreed not to bother the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 8/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nRewardOnce") == 1)
        return;

    object oPC = GetPCSpeaker();

    SetLocalInt(OBJECT_SELF, "nRewardOnce", 1);

    Reward_2daXP(oPC, 44);

    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDisappear(), OBJECT_SELF));
    //DestroyObject(OBJECT_SELF, 2.0);
}
