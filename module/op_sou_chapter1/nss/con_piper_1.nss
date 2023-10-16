//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if pc is on Piper Quest && has not
     said this line before
*/
//:://////////////////////////////////////////////
//:: Created By:    Dan Whiteside
//:: Created On:    Feb 13, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_PIPERQUEST")==10
        &&GetLocalInt(GetPCSpeaker(),"X1_PIPERSWORD")==0)
        return TRUE;
    return FALSE;
}
