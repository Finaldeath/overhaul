//::///////////////////////////////////////////////
//:: Knower of Places, Journal Entry (Action Script)
//:: H5a_Places_Jour1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Adds the journal entry
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 5, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Main", 60, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 82;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
