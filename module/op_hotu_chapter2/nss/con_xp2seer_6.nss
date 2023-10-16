//::///////////////////////////////////////////////
//:: Name con_xp2seer_6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Elder brain is dead This option only shows up once.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 29/03
//:://////////////////////////////////////////////

#include "x2_inc_globals"
int StartingConditional()
{
    if (GetGlobalInt("X2_Q2DOvermind") == 1 && GetLocalInt(OBJECT_SELF, "nDeadOvermindReported") == 0)
        return TRUE;
    return FALSE;
}
