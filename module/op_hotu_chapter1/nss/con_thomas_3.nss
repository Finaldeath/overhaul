//::///////////////////////////////////////////////
//:: Check Intelligence Low and PC know's Cynns husband
//:: con_thomas_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check Intelligence Low and PC know's Cynns husband
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 23/03
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"
#include "inc_plot_locals"
int StartingConditional()
{
    if (CheckIntelligenceLow() && DoesPCKnowCynnHusband())
        return TRUE;
    return FALSE;
}

