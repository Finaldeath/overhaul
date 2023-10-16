//::///////////////////////////////////////////////
//:: Jaboli Available
//:: con_lam_jaboli
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Jaboli is available
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oJab = GetNearestObjectByTag("os_hen_jab");
    iResult = GetIsObjectValid(oJab);
    return iResult;
}
