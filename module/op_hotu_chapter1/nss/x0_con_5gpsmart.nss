//::///////////////////////////////////////////////
//:: x0_con_5gpsmart
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    returns true if PC has 5gp and is normal iq
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
    iResult = GetGold(GetPCSpeaker()) >= 5 && CheckIntelligenceNormal() == TRUE ;
    return iResult;
}
