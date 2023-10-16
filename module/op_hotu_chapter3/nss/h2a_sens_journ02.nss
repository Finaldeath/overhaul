//::///////////////////////////////////////////////
//:: Sensei Dharvana, Journal Entry (Action Script)
//:: H2a_Sens_Journ02.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player uses True Name to force the Sensei to
     wake the Sleeping Man. She is not his one
     true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 8, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_Sensei", 20, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 181;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

}
