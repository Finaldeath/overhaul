//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Talked to Morrius (Low Int)
//:: WW1_Hag_Morr_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Morrius' "Talked" local
     has been set on the player. (Low Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 10, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bTalked = GetLocalInt(oPC, "CONV_MORRIUS_Talked");

    if (bTalked == TRUE)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
