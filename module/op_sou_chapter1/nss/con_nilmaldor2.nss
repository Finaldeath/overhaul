//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks to see if the kobolds and spiders are dead.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On:Feb 7, 2003
//:://////////////////////////////////////////////
#include "dan_plot_locals"
#include "Q2_inc_plot"
int StartingConditional()
{
    if (IsUrkoDead()&& GetPlot("Q2_SPIDERS") > 10)
        return TRUE;
    return FALSE;
}
