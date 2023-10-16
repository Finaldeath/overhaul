//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker Look at Hand Action
//:: WW1_Ragp_Look_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Records that the player has looked at their
     hand.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 3, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "CONV_RAGPICKER_LookHand", TRUE);
}
