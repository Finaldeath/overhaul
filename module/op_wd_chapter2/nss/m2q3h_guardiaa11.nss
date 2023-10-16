//::///////////////////////////////////////////////
//:: m2q2H Guardian Spirit Action Script #11
//:: m2q3H_GuardiaA11
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the module local to indicate that Quint
    won.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 29, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oModule = GetModule();

    SetLocalString(oModule, "m2q3_Resolution", "Quint");
    RewardXP("m2q3E_Charwood",100,GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_L_JudgementMade",1);
}
