//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Give Tears Message
//:: WW1_Hag_GiveTear.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Create a new copy of the Tears Message in the
     player's inventory (changed description) and
     destroy the old version.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 22, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oOldTears = GetItemPossessedBy(OBJECT_SELF, "ww1_untranslated");

    //Destroy the old book
    DestroyObject(oOldTears);

    //Create the new book
    CreateItemOnObject("ww1_scrawltrans", oPC);
}
