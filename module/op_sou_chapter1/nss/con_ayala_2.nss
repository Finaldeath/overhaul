//::///////////////////////////////////////////////
//:: Check Intelligence Low and the ring has been used
//:: con_ayala_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has low intelligence.
    and has used the ring at least once to teleport around
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 10/03
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    if (CheckIntelligenceLow() == TRUE && GetLocalInt(GetPCSpeaker(), "X1_Q1RINGUSED") == 1)
        return TRUE;
    return FALSE;
}
