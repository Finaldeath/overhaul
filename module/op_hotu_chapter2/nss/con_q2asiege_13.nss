//::///////////////////////////////////////////////
//:: Name con_q2asiege_13
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Test to see if the Rebels Do not have the Deva
    in their army
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 18/03
//:://////////////////////////////////////////////
#include "x2_inc_globals"
int StartingConditional()
{
    if (GetGlobalInt("x2_plot_deva_help") == 0)
        return TRUE;
    return FALSE;
}
