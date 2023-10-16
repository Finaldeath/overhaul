//::///////////////////////////////////////////////
//:: Name con_heron
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks to see if player is hero and at least
     normal intelligence.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Nov 1 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
#include "nw_i0_plot"
int StartingConditional()
{

    if (IsPCHero(GetPCSpeaker())&& CheckIntelligenceLow())
               return TRUE;
        return FALSE;
}

