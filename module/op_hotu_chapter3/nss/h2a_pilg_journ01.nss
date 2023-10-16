//::///////////////////////////////////////////////
//:: Githzerai Pilgrim, Journal Entry (Action Script)
//:: H2a_Pilg_Journ01.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Adds the initial XP2_Arden entry.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Arden", 10, oPC, TRUE, TRUE);
    SetLocalInt(GetModule(), "bArdensPlansKnown", TRUE);

    //Give non-repeatable XP
    int i2daRow = 71;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
