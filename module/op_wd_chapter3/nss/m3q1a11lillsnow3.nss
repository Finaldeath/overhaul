//::///////////////////////////////////////////////
//:: Normal Intelligence and have Snow Globe
//:: and doesn't know about snow globe
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

    iResult = (HasItem(GetPCSpeaker(),"M3Q1_A11_LIL_SNO")
        && CheckIntelligenceNormal())
        && GetLocalInt(GetPCSpeaker(),"SNOW_TALK_LILLIAN") == 0
        && GetLocalInt(OBJECT_SELF,"NW_G_M3Q1A11_SNOWGIVEN")==0;
    return iResult;
}
