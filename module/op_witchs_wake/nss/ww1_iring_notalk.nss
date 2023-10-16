//::///////////////////////////////////////////////
//:: Witchwork 1: Iron Ring, 1st Time Talked To
//:: WW1_IRing_NoTalk.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player hasn't talked to
     the ring before.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 29, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bTalked = GetLocalInt(oPC, "CONV_IRONRING_Talked");

    if (bTalked == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
