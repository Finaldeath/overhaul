//::///////////////////////////////////////////////
//:: Kaidala Available
//:: con_lam_kaidala
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Kaidala is available
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oKai = GetNearestObjectByTag("os_hen_kai");
    iResult = GetIsObjectValid(oKai);
    return iResult;
}
