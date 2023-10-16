//::///////////////////////////////////////////////
//:: Give Bribe
//:: act_raf_givegold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player gives Rafael his bribe
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    TakeGoldFromCreature(2000,oPC,TRUE);
    SetLocalInt(GetModule(), "OS_RAFAEL_VOTE",10);
    SetLocalInt(GetFirstPC(),"os_templeguild_pc",50);
}
