//::///////////////////////////////////////////////
//:: Becket Banner
//:: act_lam_beckbann
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sir Becket is Banner
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oBeck = GetObjectByTag("q2_sirbecket");
    SetLocalInt(oBeck,"OS_BECKET_BANNER",20);
    SetLocalInt(oPC,"OS_BANNER",90);
}
