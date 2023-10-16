//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if pc is on Piper Quest
*/
//:://////////////////////////////////////////////
//:: Created By:    Dan Whiteside
//:: Created On:    Feb 13, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_PIPERQUEST")==10)
        return TRUE;
    return FALSE;
}
