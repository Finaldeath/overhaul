//::///////////////////////////////////////////////
//:: William / Karsus (Condition - Winds Knowledge, Low Int)
//:: C_William_Wind_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player has learned of the Three Winds (Low
     Int variant).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 28, 2003
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bWinds = GetLocalInt(oPC, "bThreeWinds");

    if (bWinds == TRUE)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
