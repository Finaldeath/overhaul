//::///////////////////////////////////////////////
//:: Witchwork 1: Ahmed, Set "Won" Local
//:: WW1_Ahmed_Won_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set Ahmed's "Won" local on the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Septemeber 27, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, "CONV_AHMED_Won", TRUE);
}
