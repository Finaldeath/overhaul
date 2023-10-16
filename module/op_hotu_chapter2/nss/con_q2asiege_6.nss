//::///////////////////////////////////////////////
//:: Name con_q2asiege_6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Test to see if the Matron DOES NOT have Undead
    in her army
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 18/03
//:://////////////////////////////////////////////
#include "x2_inc_globals"
int StartingConditional()
{
    if (GetGlobalInt("x2_plot_undead_out") > 0)
        return TRUE;
    return FALSE;
}
