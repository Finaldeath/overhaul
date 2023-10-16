//::///////////////////////////////////////////////
//:: Becket Available
//:: con_lam_becket
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Becket hasn't been arrested
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oBeck = GetNearestObjectByTag("q2_sirbecket");
    iResult = GetIsObjectValid(oBeck);
    return iResult;
}
