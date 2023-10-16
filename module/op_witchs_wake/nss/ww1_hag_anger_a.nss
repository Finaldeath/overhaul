//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag Tarot, Give Anger Card
//:: WW1_Hag_Anger_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give the player the Child of Anger Tarot
     Card and flag it as their Warlock's Hand.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    CreateItemOnObject("ww1_tarotanger", oPC);
    SetLocalString(oPC, "CONV_NIGHTHAG_Warlock'sHand", "Anger");
}
