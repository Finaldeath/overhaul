//::///////////////////////////////////////////////
//:: Name con_xp2seer_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Elder brain given the mirror. This option only shows up once.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 29/03
//:://////////////////////////////////////////////

#include "x2_inc_globals"
int StartingConditional()
{
    if (GetGlobalInt("X2_Q2DOvermind") == 2 && GetLocalInt(OBJECT_SELF, "nDeadOvermindReported") == 0)
        return TRUE;
    return FALSE;
}
