//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make sure PC's haven't tried to steal here before
     before.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 13, 2003.
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "inc_plot_locals"
int StartingConditional()
{
    if ((IsMotherSalinkaMad(GetPCSpeaker()))&& CheckIntelligenceLow())
        return TRUE;
    return FALSE;
}
