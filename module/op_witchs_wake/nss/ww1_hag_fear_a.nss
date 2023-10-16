//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag Tarot, Give Fear Card
//:: WW1_Hag_Fear_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give the player the Child of Fear Tarot
     Card and flag it as their Warlock's Hand.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    CreateItemOnObject("ww1_tarotfear", oPC);
    SetLocalString(oPC, "CONV_NIGHTHAG_Warlock'sHand", "Fear");
}
