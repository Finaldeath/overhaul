//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Post-Tarot & Leak Not Activated
//:: WW1_Hag_NoLeak.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Night Hag has already
     completed this player's Tarot reading but the
     Ethereal Leak has not yet been activated.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 200
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sWitchsHand = GetLocalString(oPC, "CONV_NIGHTHAG_Witch'sHand");
    object oLeak = GetNearestObjectByTag("EtherealLeak");
    int bLeakActivated = GetLocalInt(oLeak, "bUsed");

    if (sWitchsHand != "" &&
        bLeakActivated == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
