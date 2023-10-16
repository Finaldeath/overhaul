//::///////////////////////////////////////////////
//:: Farm wife checks for Bret's ring
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "M3PLOTINCLUDE"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() && DoesPlayerHaveBretsRing(GetPCSpeaker());
    return iResult;
}

