//::///////////////////////////////////////////////
//:: Thaddeus Hand
//:: act_lam_thdhand
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Thaddeus has been set as the Hand
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: Nov 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    SetLocalInt(oPC, "OS_HAND", 100);
}
