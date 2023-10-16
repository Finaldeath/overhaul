//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag Tarot, Give Fool Card
//:: WW1_Hag_Fool_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give the player the Fool Tarot Card and
     flag it as their Witch's Hand.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    CreateItemOnObject("ww1_tarotfool", oPC);
    SetLocalString(oPC, "CONV_NIGHTHAG_Witch'sHand", "Fool");
}
