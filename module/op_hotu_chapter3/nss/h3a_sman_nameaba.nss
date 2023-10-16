//::///////////////////////////////////////////////
//:: Sleeping Man, True Name: Abandon Quest (Action Script)
//:: H2a_SMan_NameAba.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Adds the proper journal entry
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Journal Entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_SMan", 30, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 188;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
