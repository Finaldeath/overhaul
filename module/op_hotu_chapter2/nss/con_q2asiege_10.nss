//::///////////////////////////////////////////////
//:: Name con_q2asiege_10
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Test to see if the Rebels have some golems
    in their army
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 18/03
//:://////////////////////////////////////////////
#include "x2_inc_globals"
int StartingConditional()
{
    if (GetGlobalInt("x2_plot_golem1_in") == 1 ||
        GetGlobalInt("x2_plot_golem2_in") == 1)
        return TRUE;
    return FALSE;
}
