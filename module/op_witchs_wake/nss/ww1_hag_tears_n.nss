//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Tears Message (Normal Int)
//:: WW1_Hag_Tears_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is carrying
    Caldrian's untranslated Tears Message.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 22, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oBook = GetItemPossessedBy(oPC, "ww1_untranslated");

    if (oBook != OBJECT_INVALID)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
