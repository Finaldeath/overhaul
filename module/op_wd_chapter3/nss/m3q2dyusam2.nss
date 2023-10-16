//::///////////////////////////////////////////////
//:: Player spoke with Yusam previously
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "M3PLOTINCLUDE"
#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() && GetPlayerAcceptedYusamQuest(GetPCSpeaker());
    return iResult;
}

