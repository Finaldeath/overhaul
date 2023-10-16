//::///////////////////////////////////////////////
//:: Witchwork 1: Armsman, End
//:: WW1_Arm_End.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the player as having completed the
     Armsman's conv.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 26, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "CONV_ARMSMAN_End", TRUE);
}
