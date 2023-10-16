//::///////////////////////////////////////////////
//:: Sleeping Man, Player Doesn't Return Sleeping Man's Love (Action Script)
//:: H2a_SMan_NoLove.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Adds the proper journal entries
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //Flag the PC as not accepting his love.
    SetLocalInt(GetModule(), "bPlayerAcceptsSleepingMansLove", FALSE);

    //Flag the Sleeping Man as being spurned.
    SetLocalInt(GetModule(), "bSleepingManSpurned", TRUE);

    //Journal Entry
    object oPC = GetPCSpeaker();
    string sSMansLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    string sPlayersLove = GetLocalString(GetModule(), "sKnower_PlayersLove");
    if (sSMansLove == "Player" ||
        sPlayersLove == "SleepingMan")
    {
        AddJournalQuestEntry("XP2_Name_PlayersLove", 90, oPC, TRUE, TRUE, TRUE);
        //Give non-repeatable XP
        int i2daRow = 216;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }
}
