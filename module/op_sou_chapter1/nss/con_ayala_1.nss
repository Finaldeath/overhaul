//::///////////////////////////////////////////////
//:: Check if the ring has been used
//:: con_ayala_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has used the ring
    at least once to teleport around
    and that Ayala has told the PC she can
    teleport him back
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 10/03
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    int nUsed = GetLocalInt(GetPCSpeaker(), "X1_Q1RINGUSED");
    if (nUsed == 1)
        return TRUE;
    return FALSE;
}
