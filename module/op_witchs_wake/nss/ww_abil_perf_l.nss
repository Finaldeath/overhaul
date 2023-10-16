//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Perform, Low Int
//:: WW_Abil_Perf_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player has the Perform
    skill. Low Intelligence variant.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 24, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bHasPerform = GetHasSkill(SKILL_PERFORM, oPC);

    if (bHasPerform == TRUE)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
