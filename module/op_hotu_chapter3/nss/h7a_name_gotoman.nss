//::///////////////////////////////////////////////
//:: The Knower of Names, Go To Sleeping Man (Action Script)
//:: H7a_Name_GoToMan.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the fact that the player has commanded
     the Knower of Names to return to the Sleeping
     Man against her sister's wishes and be his
     one true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetModule(), "bNamesGoToSleepingMan", TRUE);

    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_Names", 30, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 166;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
