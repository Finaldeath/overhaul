//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Unfinished Tarot
//:: WW1_Hag_OneTarot.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has undergone the
     Night Hag's Tarot reading as far as the
     Warlock's Hand but not the Witch's one.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 15, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sWarlocksHand = GetLocalString(oPC, "CONV_NIGHTHAG_Warlock'sHand");
    string sWitchsHand = GetLocalString(oPC, "CONV_NIGHTHAG_Witch'sHand");

    if (sWarlocksHand != "" &&
        sWitchsHand == "")
    {
        return TRUE;
    }
    return FALSE;
}
