//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if the PC still needs herbs.

*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 12, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"NW_JOURNAL_ENTRYq1cure")<40 && CheckIntelligenceLow())
        return TRUE;
    return FALSE;
}

