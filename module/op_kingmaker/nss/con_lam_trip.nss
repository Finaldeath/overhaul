//::///////////////////////////////////////////////
//:: Trip Available
//:: con_lam_trip
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Trip is available
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oTrip = GetNearestObjectByTag("os_hen_trp");
    iResult = GetIsObjectValid(oTrip);
    return iResult;
}
