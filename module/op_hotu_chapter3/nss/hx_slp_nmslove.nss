//::///////////////////////////////////////////////
//:: Name hx_slp_nmslove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sleeping Man wakes, thinks Knower of Names
     is his love.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void hx_RemoveEffects(object oSleep);
void main()
{
    object oPC = GetPCSpeaker();
    object oSleep = GetObjectByTag("H2_SleepingMan");
    int i2daRow;
    int bDuplicate;

    // Set variables.
    SetLocalString(GetModule(), "sSleepingManThinksLoveIs", "Names");

    //Add Journal Entries
    string sThinkLove = GetLocalString(GetModule(), "sSleepingManThinksLoveIs");
    string sTrueLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sThinkLove == sTrueLove) //Player told truth
    {
        AddJournalQuestEntry("XP2_Name_SMansLove", 80, oPC, TRUE, TRUE, TRUE);
        //Give non-repeatable XP
        i2daRow = 198;
        bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }
    if (sThinkLove != sTrueLove) //Player told lie
    {
        AddJournalQuestEntry("XP2_Name_SMansLove", 100, oPC, TRUE, TRUE, TRUE);
        //Give non-repeatable XP
        i2daRow = 200;
        bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }
    string sSMansLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    string sPlayersLove = GetLocalString(GetModule(), "sKnower_PlayersLove");
    if (sSMansLove == "Player" ||
        sPlayersLove == "SleepingMan")
    {
        AddJournalQuestEntry("XP2_Name_PlayersLove", 90, oPC, TRUE, TRUE, TRUE);
        //Give non-repeatable XP
        i2daRow = 216;
        bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }

    // Wake the Sleeping Man.
    //SetLocalInt(oSleep, "bAwake", TRUE);
    //hx_RemoveEffects(oSleep);
}

void hx_RemoveEffects(object oSleep)
{
    effect eEffect = GetFirstEffect(oSleep);

    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(oSleep, eEffect);
        eEffect = GetNextEffect(oSleep);
    }
}
