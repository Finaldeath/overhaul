//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker (Player Returned By Death) Low Int
//:: WW1_Ragp_PCDie_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets a local on the player that will get set
     back to FALSE if the player returns to the
     Battlefield by foot. If it doesn't get reset,
     the Ragpicker can assume you travelled back
     by dying.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 20, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bReturnedByFoot = GetLocalInt(oPC, "bReturnedByFoot");

    if (bReturnedByFoot == FALSE)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
