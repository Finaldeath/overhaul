//::///////////////////////////////////////////////
//:: Priest guild
//:: con_mom_prieste
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The priests' guild support Enivid
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    int nPriest = GetLocalInt(oPC,"os_templeguild_pc");
    iResult = nPriest!=60 && nPriest!=100;
    return iResult;
}
