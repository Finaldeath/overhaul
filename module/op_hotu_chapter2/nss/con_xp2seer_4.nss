//::///////////////////////////////////////////////
//:: Name con_xp2seer_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the Deva is helping the Rebels
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 29/03
//:://////////////////////////////////////////////

#include "x2_inc_globals"
int StartingConditional()
{
    if (GetGlobalInt("x2_plot_deva_help") == 1 )
        return TRUE;
    return FALSE;
}
