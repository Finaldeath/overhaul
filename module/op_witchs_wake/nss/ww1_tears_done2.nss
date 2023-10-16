//::///////////////////////////////////////////////
//:: Witchwork 1: Tears Message, Translate from Item by Player
//:: WW1_Tears_Done2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the well as being descendable and
     replaces the untranslated item with the
     translated one.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oOldTears = GetItemPossessedBy(OBJECT_SELF, "ww1_untranslated");

    //Destroy the old book
    DestroyObject(oOldTears);

    //Create the new book
    CreateItemOnObject("ww1_scrawltrans", oPC);

    //Flag the well as descendable
    SetLocalInt(GetModule(), "bWellActive", TRUE);
    SendMessageToAllDMs("The Old Man's Well is now ACTIVE, allowing players "+
                        "to enter Brogan's Tears.");
}
