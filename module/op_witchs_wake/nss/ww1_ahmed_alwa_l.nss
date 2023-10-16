//::///////////////////////////////////////////////
//:: Witchwork 1: Ahmed Check, Always (Low Int)
//:: WW1_Ahmed_Alwa_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Return TRUE if the player has heard Ahmed's
    "You always were..." line. (Low Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 27, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bHate = GetLocalInt(oPC, "CONV_AHMED_Always");

    if (bHate == TRUE)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
