//::///////////////////////////////////////////////
//:: Low IQ, Have Star Sapphire
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

    iResult = (HasItem(GetPCSpeaker(),"M3Q1_A11_LIL_STA")
        && CheckIntelligenceLow()
        && GetLocalInt(OBJECT_SELF,"NW_G_M3Q1A_STARFOUND")==0);
    return iResult;
}

