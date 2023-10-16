//::///////////////////////////////////////////////
//:: Wolves, Journal Entry (Action Script)
//:: H8a_Wolf_Journ01.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Add the first journal entry in the Wolf
     quest.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Wolves", 10, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 59;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
