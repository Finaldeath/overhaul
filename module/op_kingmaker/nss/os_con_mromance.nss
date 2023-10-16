//::///////////////////////////////////////////////
//:: os_con_mromance
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PC is on the Kaidala romance plot
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    int nRomance = GetLocalInt(oPC,"OS_KAI_ROMANCE");
    iResult = nRomance >= 10 && nRomance < 99;
    return iResult;
}
