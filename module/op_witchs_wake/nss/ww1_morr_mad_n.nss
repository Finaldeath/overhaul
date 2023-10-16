//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Morrius went Mad (Normal Int)
//:: WW1_Morr_Mad_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Morrius' "Mad"
     local is flagged on the player. (Normal Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 10, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bMad = GetLocalInt(oPC, "CONV_MORRIUS_Mad");

    if (bMad == TRUE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
