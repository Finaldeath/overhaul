//::///////////////////////////////////////////////
//:: Witchwork 1: Tears Message, Translation Failed
//:: WW1_Tears_Fail.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player previously failed
     the translation (this prevents them from
     re-attempting).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 1, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bFailed = GetLocalInt(oPC, "bFailedTranslation");

    if (bFailed == TRUE)
    {
    return TRUE;
    }
    return FALSE;
}
