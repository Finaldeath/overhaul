//::///////////////////////////////////////////////
//:: Normal Intelligence and have picked up Snow Globe
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "nw_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = (GetLocalInt(GetPCSpeaker(),"HasSnowGlobe") ==1 && CheckIntelligenceNormal());
    return iResult;
}

