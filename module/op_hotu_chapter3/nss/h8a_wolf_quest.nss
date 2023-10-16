//::///////////////////////////////////////////////
//:: Wolves, Give Quest (Action Script)
//:: H8a_Wolf_Quest.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the wolf quest as active.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    SetLocalInt(GetModule(), "bWolfQuestGiven", TRUE);

    //Add the journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Wolves", 20, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 60;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
