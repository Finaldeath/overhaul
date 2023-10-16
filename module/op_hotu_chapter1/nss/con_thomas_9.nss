//::///////////////////////////////////////////////
//:: Check Intelligence Normal and the PC knows Cynn's husband
//:: con_thomas_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check Intelligence Normal and the PC doesn't
    know Cynn's husband
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 29/03
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"
#include "inc_plot_locals"
int StartingConditional()
{
    if (CheckIntelligenceLow() && !DoesPCKnowCynnHusband())
        return TRUE;
    return FALSE;
}
