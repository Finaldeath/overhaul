//::///////////////////////////////////////////////
//:: m2q2H Guardian Spirit Action Script #10
//:: m2q3H_GuardiaA10
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the module local to indicate that Karlat
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

    SetLocalString(oModule, "m2q3_Resolution", "Karlat");
    RewardXP("m2q3E_Charwood",75,GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_L_JudgementMade",1);
}
