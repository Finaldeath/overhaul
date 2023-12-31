//::///////////////////////////////////////////////
//:: Witchwork 1: Helga Einswater, Exhibits (Normal Int)
//:: WW1_Helga_ExhibN.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player already knows
     about the Guild Exhibits upstairs (Normal Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 25, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bExhibits = GetLocalInt(oPC, "CONV_HELGA_Exhibits");

    if (bExhibits == TRUE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
