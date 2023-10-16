//::///////////////////////////////////////////////
//:: Name con_q2asiege_9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Test to see if the Rebels DO NOT have any golems
    in their army
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 18/03
//:://////////////////////////////////////////////
#include "x2_inc_globals"
int StartingConditional()
{
    if (GetGlobalInt("x2_plot_golem1_in") == 0 &&
        GetGlobalInt("x2_plot_golem2_in") == 0)
        return TRUE;
    return FALSE;
}
