//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Player Has Finger (Low Int)
//:: WW1_Hag_Fing_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is carrying their
     severed finger. (Low Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 8, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oFinger = GetItemPossessedBy(oPC, "ww1_severedfinger");
    int bNoFinger = GetLocalInt(oPC, "CONV_RAGPICKER_Fingerless");

    if (bNoFinger == TRUE &&
        oFinger != OBJECT_INVALID)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
