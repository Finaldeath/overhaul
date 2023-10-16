//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Go To Leak
//:: WW1_Hag_GoLeak.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having the Night Hag's
     instructions on how to activate the Leak.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 21, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "CONV_NIGHT_HAG_Leak", TRUE);
}
