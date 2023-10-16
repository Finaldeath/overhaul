//::///////////////////////////////////////////////
//:: Witchwork 1: Helga Einswater, Untranslated Message (Low Int)
//:: WW1_Helga_Note_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is carrying the
    untranslated message (Low Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 13, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oNote = GetItemPossessedBy(oPC, "ww1_untranslated");

    if (oNote != OBJECT_INVALID)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
