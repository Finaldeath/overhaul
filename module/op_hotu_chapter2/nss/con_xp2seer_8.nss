//::///////////////////////////////////////////////
//:: Name con_xp2seer_8
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
If golems are allied with players. Only shows up once.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 29/03
//:://////////////////////////////////////////////

#include "x2_inc_globals"
int StartingConditional()
{
    if ((GetGlobalInt("x2_plot_golem1_in") == 1 ||
        GetGlobalInt("x2_plot_golem2_in") == 1) && GetLocalInt(OBJECT_SELF, "nGolemsReported") == 0)
        return TRUE;
    return FALSE;
}
