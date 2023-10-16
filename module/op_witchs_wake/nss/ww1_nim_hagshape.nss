//::///////////////////////////////////////////////
//:: Witch Wake 1: Nimmermaer, Hag is a Shapechanger
//:: WW1_Nim_HagShape.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as knowing that the Night
     Hag is a shapeshifter. This allows you to
     challenge here in the PoS and accuse her of
     being the Ragpicker.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 7, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "HagIsShapechanger", TRUE);
}
