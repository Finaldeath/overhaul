//::///////////////////////////////////////////////
//:: Sleeping Man, Wake Up - Knife Variation (Action Script)
//:: H3a_SMan_Wake_Kn.nss
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
    //Evil hit
    object oPC = GetPCSpeaker();
    AdjustAlignment(oPC, ALIGNMENT_EVIL, 10);

    //Flag PC as having cut Sleeping Man
    object oMan = GetObjectByTag("H2_SleepingMan");
    SetLocalInt(oMan, "bPlayerCutMe", TRUE);

    //Wake the Sleeping Man
    WakeSleepingMan();

    //Add journal entry
    AddJournalQuestEntry("XP2_Pilgrims", 150, oPC, TRUE, TRUE);
    //Give non-repeatable XP
    int i2daRow = 96;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
