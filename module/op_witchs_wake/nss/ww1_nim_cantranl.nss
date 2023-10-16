//::///////////////////////////////////////////////
//:: Witchwork 1: Nimmermaer, Can Translate (Low Int)
//:: WW1_Nim_CanTranL.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has learned that
     Nimmermaer can translate the tears message.
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
    object oTears = GetItemPossessedBy(oPC, "ww1_untranslated");

    if (oBook != OBJECT_INVALID ||
        oTears != OBJECT_INVALID)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
