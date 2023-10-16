//::///////////////////////////////////////////////
//:: Generic Devil, Journal Entry (Action Script)
//:: H2a_Devil_Jour01.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Add the initial XP2_Pilgrims journal entry
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Pilgrims", 10, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 89;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}

