//::///////////////////////////////////////////////
//:: Witchwork 1: Nimmermaer, Not Talked To
//:: WW1_Nim_Talked_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has not yet talked
     to Nimmermaer.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 22, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bTalkedToNim = GetLocalInt(oPC, "CONV_NIMMER_TalkedTo");

    if (bTalkedToNim == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
