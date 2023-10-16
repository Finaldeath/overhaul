//::///////////////////////////////////////////////
//:: Name con_q2aseer_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This will only appear if either the Mindflayers
    or the Beholders have not been taken away from the
    Matron's army
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 12/03
//:://////////////////////////////////////////////
#include "x2_inc_globals"
int StartingConditional()
{
    if (GetGlobalInt("x2_plot_beholders_out") == 0 || GetGlobalInt("X2_Q2DOvermind") < 2)
        return TRUE;
    return FALSE;
}
