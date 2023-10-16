//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Set "Not Ready" Local
//:: WW1_Hag_NotReady.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set Night Hag's "Not Ready" local on the
     player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Ocotber 17, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, "CONV_NIGHT_HAG_NotReady", TRUE);
}
