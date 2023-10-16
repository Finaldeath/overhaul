//::///////////////////////////////////////////////
//:: Witchwork 1: Nimmermaer, Take Night Hag's Book
//:: WW1_Nim_TakeHgBk.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Takes the untranslated Night Hag's Book from
     the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 22, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oBook = GetItemPossessedBy(oPC, "ww1_NightHagBook");

    ActionTakeItem(oBook, oPC);
}
