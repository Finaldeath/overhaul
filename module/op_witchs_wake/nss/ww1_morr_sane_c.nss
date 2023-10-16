//::///////////////////////////////////////////////
//:: Witchwork 1: Morrius, Sanity condition
//:: WW1_Morr_Sane_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Morrius' "Talked" local
     has been set on the player but the "Mad"
     local is FALSE.
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
        bMad == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
