//::///////////////////////////////////////////////
//:: Name con_xp2seer_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the Dracolich is dead - only report this once
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 29/03
//:://////////////////////////////////////////////

#include "x2_inc_globals"
int StartingConditional()
{
    if (GetGlobalInt("x2_plot_undead_out") == 1 && GetLocalInt(OBJECT_SELF, "nDracolichReported") == 0)
        return TRUE;
    return FALSE;
}
