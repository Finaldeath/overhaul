//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Declare Holiday (Action Script)
//:: H2a_Gruul_Holida.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player convinces Gru'ul to declare a holiday
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 18, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Set Local
    SetLocalInt(GetModule(), "bQuarryHoliday", TRUE);

    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Quarry", 90, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 104;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
