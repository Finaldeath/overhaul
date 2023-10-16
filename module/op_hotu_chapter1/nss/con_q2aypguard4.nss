//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if pc has 50 gold and int.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Nov 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
        if (CheckIntelligenceLow()&& GetGold(GetPCSpeaker())>=50)
               return TRUE;
        return FALSE;
}

