//::///////////////////////////////////////////////
//:: Witchwork 1: Helga Einswater, Post-Exhibit (Normal Int)
//:: WW1_Helga_Post_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player has entered the
    Exhibit area. (Normal Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 13, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bEntered = GetLocalInt(oPC, "AREA_EXHIBITS_Entered");

    if (bEntered == TRUE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
