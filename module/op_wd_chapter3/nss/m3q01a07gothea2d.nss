//::///////////////////////////////////////////////
//:: Dumb and has Guzud head
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:       Brent
//:: Created On:       November 2001
//:://////////////////////////////////////////////
#include "nw_i0_plot"

int StartingConditional()
{
    int l_iResult;

    if(GetLocalInt(OBJECT_SELF,"NW_G_M3Q1A_ROLKIDGUZUD")==0
        && CheckIntelligenceLow()
        && HasItem(GetPCSpeaker(),"M3Q3_A02GUZUD"))
    {
        l_iResult = TRUE;
    }
    else
    {
        l_iResult = FALSE;
    }
    return l_iResult;
}



