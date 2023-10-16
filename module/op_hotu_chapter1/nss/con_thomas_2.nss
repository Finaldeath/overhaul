//::///////////////////////////////////////////////
//:: Check Intelligence Normal and the PC knows Cynn's husband
//:: con_thomas_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check PC knows Cynn's husband
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 23/03
//:://////////////////////////////////////////////


#include "inc_plot_locals"
int StartingConditional()
{
    if (DoesPCKnowCynnHusband())
        return TRUE;
    return FALSE;
}
