//::///////////////////////////////////////////////
//:: Witch's Wake 1: Caldrian, Player Has Message
//:: WW1_Cald_TearMsg.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has a copy of the
     Tears Message
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 28, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oUntranslated = GetItemPossessedBy(oPC, "ww1_untranslated");
    object oTranslated = GetItemPossessedBy(oPC, "ww1_scrawltrans");

    if (oUntranslated != OBJECT_INVALID ||
        oTranslated != OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
