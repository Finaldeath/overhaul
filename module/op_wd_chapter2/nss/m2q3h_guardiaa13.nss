//::///////////////////////////////////////////////
//:: m2q2H Guardian Spirit Action Script #13
//:: m2q3H_GuardiaA13
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the module local to indicate that the
    Guardian kept the phylactery.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 29, 2002
//:://////////////////////////////////////////////

void main()
{
    object oModule = GetModule();

    SetLocalString(oModule, "m2q3_Resolution", "Guardian");
    SetLocalInt(OBJECT_SELF,"NW_L_JudgementMade",1);
}
