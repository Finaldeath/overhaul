//::///////////////////////////////////////////////
//:: Witchwork 1: Nimmermaer, Talked To
//:: WW1_Nim_Talked_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having talked to
     Nimmermaer.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 22, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "CONV_NIMMER_TalkedTo", TRUE);
}
