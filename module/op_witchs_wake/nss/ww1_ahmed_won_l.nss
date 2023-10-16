//::///////////////////////////////////////////////
//:: Witchwork 1: Ahmed Check, Won (Low Int)
//:: WW1_Ahmed_Won_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Return TRUE if the player has heard Ahmed's
    "We have already won..." line. (Low Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 27, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bHate = GetLocalInt(oPC, "CONV_AHMED_Won");

    if (bHate == TRUE)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
