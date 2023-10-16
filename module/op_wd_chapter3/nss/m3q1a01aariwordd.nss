//::///////////////////////////////////////////////
//:: Checks for a Word Of Power     , Dumb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the global, LastWord = the first word detected.
    In the reward script, Aarin will take the LastWord
*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   November 2001
//:://////////////////////////////////////////////

#include "M3PLOTINCLUDE"
#include "nw_i0_plot"

int StartingConditional()
{
    return (CheckIntelligenceLow() && HaveAnyWord(GetPCSpeaker()) == TRUE);
}
