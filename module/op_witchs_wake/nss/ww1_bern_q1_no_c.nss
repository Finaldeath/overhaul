//::///////////////////////////////////////////////
//:: Witchwork 1: Bernhardt, Potion Quest Inactive (Base Condition)
//:: WW1_Bern_Q1_No_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is not yet on the
    Potion Quest.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 20, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bQuestActive = GetLocalInt(oPC, "CONV_BERNHARDT_GavePotionGold");

    if (bQuestActive == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
