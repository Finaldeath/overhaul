//::///////////////////////////////////////////////
//:: Witchwork 1: Morrius, Witchbane End
//:: WW1_Morr_WB_End.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having completed the
     Witchbane conv branch so it isn't repeated.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 24, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "CONV_MORR_WitchbaneEnd", TRUE);
}
