//::///////////////////////////////////////////////
//:: Calibast Available
//:: con_lam_calibast
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Calibast is available
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oCal = GetNearestObjectByTag("os_hen_cal");
    iResult = GetIsObjectValid(oCal);
    return iResult;
}
