//::///////////////////////////////////////////////
//:: m2q3H Guardian Spirit Action Script #8
//:: m2q3H_GuardianA8
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The guardian spirit takes Belial's oath.
;*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 28, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oPC = GetPCSpeaker();
    object oBelialOath = GetItemPossessedBy(oPC,"M2Q3_OATHBELIAL");

    ActionTakeItem(oBelialOath, oPC);
    RewardXP("m2q3E_Charwood",75,GetPCSpeaker());
}

