//::///////////////////////////////////////////////
//:: Witchwork 1: Ratling, End
//:: WW1_Ratl_End.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the player as having completed the
     Ratling conv.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 26, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "CONV_RATLING_End", TRUE);
}
