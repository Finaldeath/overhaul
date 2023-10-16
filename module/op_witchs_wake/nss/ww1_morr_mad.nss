//::///////////////////////////////////////////////
//:: Witchwork 1: Morrius, Set "Mad" Local
//:: WW1_Morr_Mad.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set Morrius' "Mad" local on the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 10, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, "CONV_MORRIUS_Mad", TRUE);
}
