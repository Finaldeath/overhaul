//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Morrius Spoke of Prince (Low Int)
//:: WW1_Morr_Princ_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Morrius' "Prince" local
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
    int bTrust = GetLocalInt(oPC, "CONV_MORRIUS_Prince");

    if (bTrust == TRUE)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
