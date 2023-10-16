//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag Tarot, Give Traitor Card
//:: WW1_Hag_Traito_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give the player the Traitor Tarot Card and
     flag it as their Witch's Hand.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    CreateItemOnObject("ww1_tarottraitor", oPC);
    SetLocalString(oPC, "CONV_NIGHTHAG_Witch'sHand", "Traitor");
}
