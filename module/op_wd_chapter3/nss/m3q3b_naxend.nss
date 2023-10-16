//::///////////////////////////////////////////////
//:: M3Q3B_NAXEND
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Nax has been rescued, he will escape area.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 11, 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    if (GetLocalInt(GetModule(),"NW_G_NaxPlot") == 99)
    {
        EscapeArea();
    }
}
