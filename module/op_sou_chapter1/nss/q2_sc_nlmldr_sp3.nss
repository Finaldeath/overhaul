//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if the spiders are dead and eggs crushed.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 5, 2003
//:://////////////////////////////////////////////
#include "q2_inc_plot"

int StartingConditional()
{
    if (GetPlot("Q2_SPIDERS") == 80 ||GetPlot("Q2_SPIDERS")== 90)
        return TRUE;
    return FALSE;
}
