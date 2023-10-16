//::///////////////////////////////////////////////
//:: Witchwork 1: Bernhardt, Potion Quest Inactive (Normal Int)
//:: WW1_Bern_Q1_No_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is not yet on the
    Potion Quest.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 20, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bQuestActive = GetLocalInt(oPC, "CONV_BERNHARDT_GavePotionGold");

    if (bQuestActive == FALSE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
