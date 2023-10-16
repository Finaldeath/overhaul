//::///////////////////////////////////////////////
//:: x0_con_1gpsmart
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    returns true ifhas 1gp and is normal iq
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
    iResult = GetGold(GetPCSpeaker()) >= 1 && CheckIntelligenceNormal() == TRUE ;
    return iResult;
}
