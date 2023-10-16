//::///////////////////////////////////////////////
//:: Witchwork 1: Helga Einswater, Talked To Condition
//:: WW1_Helga_Talk_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has not yet talked
     to her.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 4, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bTalked = GetLocalInt(oPC, "CONV_HELGA_TalkedTo");

    if (bTalked == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
