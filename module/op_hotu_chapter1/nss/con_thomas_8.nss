//::///////////////////////////////////////////////
//:: Check PC knows Cynn's husband
//:: con_thomas_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check the PC doesn't
    know Cynn's husband
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 29/03
//:://////////////////////////////////////////////

#include "inc_plot_locals"
int StartingConditional()
{
    if (!DoesPCKnowCynnHusband())
        return TRUE;
    return FALSE;
}

