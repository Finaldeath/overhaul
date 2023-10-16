//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Is Thomas dead?
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 13, 2003.
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "inc_plot_locals"
int StartingConditional()
{
    if ((ThomasIsDead(GetPCSpeaker())))
        return TRUE;
    return FALSE;
}
