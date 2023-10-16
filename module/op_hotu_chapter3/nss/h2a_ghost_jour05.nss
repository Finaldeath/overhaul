//::///////////////////////////////////////////////
//:: Generic Spirit of the Dead, Journal Entry (Action Script)
//:: H2a_Ghost_Jour05.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Add the initial XP2_Scrivener journal entry.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 18, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Scrivener", 10, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 126;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
