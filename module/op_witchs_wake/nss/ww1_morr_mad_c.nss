//::///////////////////////////////////////////////
//:: Witchwork 1: Morrius, Madness condition
//:: WW1_Morr_Mad_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Morrius' "Talked" local
     has been set on the player and the "Mad"
     local is TRUE.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 10, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bMad = GetLocalInt(oPC, "CONV_MORRIUS_Mad");
    int bTalked = GetLocalInt(oPC, "CONV_MORRIUS_Prince");

    if (bTalked == TRUE &&
        bMad == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
