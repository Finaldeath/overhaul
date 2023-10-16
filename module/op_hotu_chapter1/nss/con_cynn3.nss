//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Does the pc have Thomas's Ring?
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 15, 2003.
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    if ((GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "q2a1ring"))) && CheckIntelligenceLow())
        return TRUE;
    return FALSE;
}
