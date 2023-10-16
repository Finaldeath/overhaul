//::///////////////////////////////////////////////
//:: Sleeping Man, Wake Up - Trumpet Variation (Action Script)
//:: H3a_SMan_Wake_Tr.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Wake up the Sleeping Man and teleport in a
     hostile Sensei.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////
#include "inc_sleepingman"
#include "nw_i0_plot"
void main()
{
    //Stop the Trumpet VFX.

    //Wake the Sleeping Man & teleport a hostile Sensei in.
    WakeSleepingMan();

    //Add journal entries
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Pilgrims", 150, oPC, TRUE, TRUE);
    //Give non-repeatable XP
    int i2daRow = 96;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    AddJournalQuestEntry("XP2_Arden", 80, oPC, TRUE, TRUE);
    //Give non-repeatable XP
    i2daRow = 77;
    bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

}
