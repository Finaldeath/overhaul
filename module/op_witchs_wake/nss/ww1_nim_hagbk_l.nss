//::///////////////////////////////////////////////
//:: Witchwork 1: Nimmermaer, Night Hag's Book (Low Int)
//:: WW1_Nim_HagBk_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is carrying the
    Night Hag's Tome.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 22, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oBook = GetItemPossessedBy(oPC, "ww1_NightHagBook");

    if (oBook != OBJECT_INVALID)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
