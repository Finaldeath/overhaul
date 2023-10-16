//::///////////////////////////////////////////////
//:: M3Q1A11_NOSNOWL
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks for low intelligence and doesn't have snow globe
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"
int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow()
        && !(HasItem(GetPCSpeaker(),"M3Q1_A11_LIL_SNO"));
    return iResult;
}
