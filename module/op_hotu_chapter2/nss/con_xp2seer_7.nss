//::///////////////////////////////////////////////
//:: Name con_xp2seer_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the Hive Mother is dead This option only shows up once.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 29/03
//:://////////////////////////////////////////////

#include "x2_inc_globals"
int StartingConditional()
{
    if (GetGlobalInt("x2_plot_beholders_out") == 1 && GetLocalInt(OBJECT_SELF, "nBeholdersReported") == 0)
        return TRUE;
    return FALSE;
}
