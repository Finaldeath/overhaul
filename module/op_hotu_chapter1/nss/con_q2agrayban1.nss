//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC has heard story before.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 7, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"NW_GRAYBANSTORY")==10)
        return TRUE;
    return FALSE;
}
