//::///////////////////////////////////////////////
//:: Witchwork 1: Helga Einswater, 50 gp (low int)
//:: WW1_Helga_50gp_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has 50 gp. (low
     Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 24, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iGold = GetGold(oPC);

    if (iGold >= 50)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
