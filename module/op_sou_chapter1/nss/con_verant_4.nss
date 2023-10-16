//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC is on Thaymart quest and check int.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 12, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_THAYQUEST") == 1 && CheckIntelligenceLow())
        return TRUE;
    return FALSE;
}
