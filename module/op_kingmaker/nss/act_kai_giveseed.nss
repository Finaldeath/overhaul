//::///////////////////////////////////////////////
//:: act_kai_giveseed
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kaidala gives the acorn to the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    CreateItemOnObject("q1_kaidala_seed",oPC);
    SetLocalInt(GetFirstPC(), "OS_KAI_PLANT",10);
}
