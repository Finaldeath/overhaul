//::///////////////////////////////////////////////
//:: Witchwork 1: Nimmermaer, Take Tears Message
//:: WW1_Nim_TakeTear.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Takes the untranslated Tears Message from
     the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 22, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oTears = GetItemPossessedBy(oPC, "ww1_untranslated");

    ActionTakeItem(oTears, oPC);
}
