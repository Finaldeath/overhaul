//::///////////////////////////////////////////////
//:: Witchwork 1: Bernhardt (2nd Time Talked To)
//:: WW1_Bern_2ndTime.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Not a true 2nd-Time-Talked-To script. Returns
     TRUE if the player has started the potion
     quest but not completed it yet.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 20, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bQuestStarted = GetLocalInt(oPC, "CONV_BERNHARDT_GavePotionGold");
    int bQuestCompleted = GetLocalInt(oPC, "CONV_BERNHARDT_PotionPlotComplete");

    if (bQuestStarted == TRUE &&
        bQuestCompleted == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
