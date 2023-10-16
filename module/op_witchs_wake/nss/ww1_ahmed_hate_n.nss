//::///////////////////////////////////////////////
//:: Witchwork 1: Ahmed Check, Hate (Normal Int)
//:: WW1_Ahmed_Hate_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Return TRUE if the player has heard Ahmed's
    "Do not hate me..." line. (Normal Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 27, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bHate = GetLocalInt(oPC, "CONV_AHMED_Hate");

    if (bHate == TRUE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
