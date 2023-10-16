//::///////////////////////////////////////////////
//:: x0_con_8gpsmart
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    returns true if PC has 8gp and is normal iq
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_plot_func"
#include "nw_i0_plot"
int StartingConditional()
{
    int iResult;
    iResult = GetGold(GetPCSpeaker()) >= 8 && CheckIntelligenceNormal() == TRUE ;
    return iResult;
}
