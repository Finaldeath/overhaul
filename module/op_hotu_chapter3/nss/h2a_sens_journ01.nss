//::///////////////////////////////////////////////
//:: Sensei Dharvana, Journal Entry (Action Script)
//:: H2a_Sens_Journ01.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player uses True Name to force the Sensei to
     wake the Sleeping Man. She is his one true
     love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 8, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Journal entries
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_Sensei", 25, oPC, TRUE, TRUE, TRUE);
    //Give non-repeatable XP
    int i2daRow = 182;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    AddJournalQuestEntry("XP2_Name_SMansLove", 80, oPC, TRUE, TRUE, TRUE);
    //Give non-repeatable XP
    i2daRow = 198;
    bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }


    //Flag the fact that Sleeping Man has found his one true love.
    SetLocalInt(GetModule(), "bSleepingManFindsTrueLove", TRUE);
    SetLocalString(GetModule(), "sSleepingManThinksTrueLoveIs", "Sensei");

    //Flag the fact that the Sensei believes herself to be the true love.
    SetLocalInt(OBJECT_SELF, "bThinksSheIsSleepingMansTrueLove", TRUE);
}
