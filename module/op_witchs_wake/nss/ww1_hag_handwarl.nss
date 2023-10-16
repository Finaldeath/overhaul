//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag's Tarot, Warlock's Hand
//:: WW1_Hag_HandWarl.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Selects a card from the Warlock's Hand for
     the player (as they have to meet certain
     criteria for certain cards, don't use this
     as a reliable indicator of what they
     actually received).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int iWarlocksHand = Random(5)+1;
    SetLocalInt(oPC, "iWarlocksHand", iWarlocksHand);
}
