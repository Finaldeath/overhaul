//::///////////////////////////////////////////////
//:: Witchwork 1: Johann, Bernhardt Told of Johann's Death (Normal Int)
//:: WW1_Joh_Bro_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Bernhardt told the player
     about his brother's death. (NOrmal Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 24, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bBrother = GetLocalInt(oPC, "CONV_BERNHARDT_DeadBrother");

    if (bBrother == TRUE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
