//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Headstone Action
//:: WW1_Hag_Headst_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having asked about the
     Headstone so it doesn't show up again.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 4, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "CONV_NIGHT_HAG_Headstone", TRUE);
}
