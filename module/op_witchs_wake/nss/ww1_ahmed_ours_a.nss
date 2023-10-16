//::///////////////////////////////////////////////
//:: Witchwork 1: Ahmed, Set "Ourselves" Local
//:: WW1_Ahmed_Ours_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set Ahmed's "Ourselves" local on the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Septemeber 27, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, "CONV_AHMED_Ourselves", TRUE);
}
