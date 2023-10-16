//::///////////////////////////////////////////////
//:: Witchwork 1: Johann, Bernhardt Confided What He'd Tell Johann (Low Int)
//:: WW1_Joh_BroMsg_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Bernhardt told the player
     what he'd tell his dead brother. (Low Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 24, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bTellBrother = GetLocalInt(oPC, "CONV_BERNHARDT_TellBrother");

    if (bTellBrother == TRUE)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
