//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q5cs_Gerrol001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has a normal intelligence
    and either the Leah or Dergiab plots are
    incomplete.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 27, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal() &&
           (GetLocalInt(GetModule(), "NW_G_M2Q05PLOTDERG") < 20 ||
           GetLocalInt(GetModule(), "NW_G_LEAH_HOME") < 20);
}
