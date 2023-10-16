//::///////////////////////////////////////////////
//:: Scrivener, Journal Entry (Action Script)
//:: H2a_Scrv_Journ02.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Add the journal entry for the first rebus
     puzzle.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 18, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Scrivener", 30, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 128;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

}
