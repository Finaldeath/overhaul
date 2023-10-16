//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick Journal Entry (Action Script)
//:: H2a_Card_Journ02.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Adds journal entry regarding Arden's mention
     of the Trumpet.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    object oSleepingMan = GetObjectByTag("H2_SleepingMan");
    int bAwake = GetLocalInt(oSleepingMan, "bAwake");
    if (oSleepingMan != OBJECT_INVALID &&
        bAwake == FALSE)
    {
        AddJournalQuestEntry("XP2_Arden", 30, oPC, TRUE, TRUE);
    }

    //Give non-repeatable XP
    int i2daRow = 73;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
}
