//::///////////////////////////////////////////////
//:: Sleeping Man, Player Kisses Him or performs similar confirming act (Action Script)
//:: H2a_SMan_Kiss.nss
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
    //Flag the PC as accepting his love.
    SetLocalInt(GetModule(), "bPlayerAcceptsSleepingMansLove", TRUE);

    //Flag the Sleeping Man as being un-spurned.
    SetLocalInt(GetModule(), "bSleepingManSpurned", FALSE);

    //Journal Entry
    object oPC = GetPCSpeaker();
    string sSMansLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    string sPlayersLove = GetLocalString(GetModule(), "sKnower_PlayersLove");
    if (sSMansLove == "Player" ||
        sPlayersLove == "SleepingMan")
    {
        AddJournalQuestEntry("XP2_Name_PlayersLove", 80, oPC, TRUE, TRUE, TRUE);
        //Give non-repeatable XP
        int i2daRow = 215;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }
    else
    {
        AddJournalQuestEntry("XP2_Name_PlayersLove", 100, oPC, TRUE, TRUE, TRUE);
        //Give non-repeatable XP
        int i2daRow = 217;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }
}
