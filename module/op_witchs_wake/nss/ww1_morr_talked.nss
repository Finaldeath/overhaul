//::///////////////////////////////////////////////
//:: Witchwork 1: Morrius, Set "Talked" Local
//:: WW1_Morr_Talked.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set Morrius' "Talked" local on the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 10, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, "CONV_MORRIUS_Talked", TRUE);
}
