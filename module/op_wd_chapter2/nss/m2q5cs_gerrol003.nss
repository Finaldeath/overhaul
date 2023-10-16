//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q5cs_Gerrol003
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the Dergiab plot is incomplete.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 27, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    return GetLocalInt(GetModule(), "NW_G_M2Q05PLOTDERG") < 20;
}
