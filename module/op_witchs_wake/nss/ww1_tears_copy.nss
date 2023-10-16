//::///////////////////////////////////////////////
//:: Witchwork 1: Tears Message, Make Copy
//:: WW1_Tears_Copy.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a copy of the message in the player's
    inventory.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On:    October 28, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    CreateItemOnObject("ww1_untranslated", oPC);
}
