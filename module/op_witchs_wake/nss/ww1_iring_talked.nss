//::///////////////////////////////////////////////
//:: Witchwork 1: Iron Ring, Talked
//:: WW1_IRing_Talked.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having talked to the Iron
     Ring.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "CONV_IRONRING_Talked", TRUE);
}
