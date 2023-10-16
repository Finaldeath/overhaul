//::///////////////////////////////////////////////
//:: Witchwork 1: Bernhardt (Quest Complete)
//:: WW1_Bern_Done.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Not a true 3rd-Time-Talked-To script. Returns
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
    int bQuestCompleted = GetLocalInt(oPC, "CONV_BERNHARDT_PotionPlotComplete");

    if (bQuestCompleted == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
