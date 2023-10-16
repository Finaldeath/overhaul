//::///////////////////////////////////////////////
//:: The Knower of Names, Player's Love = Aribeth (Condition Script)
//:: H7c_Name_PCLov10.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Decides the identity of the Player's one true
     love.

     Returns TRUE if it's Aribeth.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sLove;
    int iJournal;
    int i2daRow;
    int iAribethRomance = GetLocalInt(GetModule(), "iAribethRomance");
    int iNathyrraRomance = GetLocalInt(GetModule(), "iNathyrraRomance");
    int iValenRomance = GetLocalInt(GetModule(), "iValenRomance");
    int iGender = GetGender(oPC);
    string sSleepingLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
/*DEBUG*///SendMessageToPC(oPC, "DEBUG: Romance Values Not Yet Determined!");

    //Select the Sleeping Man if he's already claimed her as his one true love
    if (sSleepingLove == "Player")
    {
        sLove = "SleepingMan";
        iJournal = 50;
        i2daRow = 212;
    }

    //Select Aribeth if her romance value is higher than Nathyrra's and the
    //Sleeping Man hasn't already claimed her as his one true love
    if (iAribethRomance == 1 &&
        iNathyrraRomance == 0 &&
        sSleepingLove != "Aribeth")
    {
        sLove = "Aribeth";
        iJournal = 10;
        i2daRow = 208;
    }

    //Select Nathyrra if her romance value is higher than Aribeth's
    else if (iNathyrraRomance == 2 &&
             iAribethRomance == 0 &&
             sSleepingLove != "Nathyrra")
    {
        sLove = "Nathyrra";
        iJournal = 20;
        i2daRow = 209;
    }

    //If the two values are equal but not zero, pick randomly.
    else if (iAribethRomance == 1 &&
             iNathyrraRomance == 2)
    {
        int iRandom = Random(2);
        if (sSleepingLove == "Nathyrra" ||
            (iRandom == 1 &&
             sSleepingLove != "Aribeth"))
        {
            sLove = "Aribeth";
            iJournal = 10;
            i2daRow = 208;
        }
        else
        {
            sLove = "Nathyrra";
            iJournal = 20;
            i2daRow = 209;
        }
    }

    //Select Valen if his romance value is equal to 2
    else if (iValenRomance == 2)
    {
        sLove = "Valen";
        iJournal = 40;
        i2daRow = 211;
    }

    //1-in-3 chance of selecting the Sleeping Man if the player is female.
    else if (iGender == GENDER_FEMALE)
    {
        int iFemaleRandom = Random(3)+1;
        if (iFemaleRandom == 1 &&
            sSleepingLove == "")
        {
            sLove = "SleepingMan";
            iJournal = 50;
            i2daRow = 212;
        }
        else if (iFemaleRandom == 2)
        {
            sLove = "GenericMale";
            iJournal = 60;
            i2daRow = 213;
        }
        else
        {
            sLove = "NoTrueLove";
            iJournal = 70;
            i2daRow = 214;
        }
    }

    //Remaining males have 50% chance of having Generic Female
    else
    {
        int iMaleRandom = Random(2)+1;
        if (iMaleRandom == 1)
        {
            sLove = "GenericFemale";
            iJournal = 30;
            i2daRow = 210;
        }
        else
        {
            sLove = "NoTrueLove";
            iJournal = 70;
            i2daRow = 214;
        }
    }

    //Save out the string.
    SetLocalString(GetModule(), "sKnower_PlayersLove", sLove);

    //Add journal entries
    AddJournalQuestEntry("XP2_Name_PlayersLove", iJournal, oPC, TRUE, TRUE);
    //Give non-repeatable XP
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }
    if (iJournal == 50)
    {
        AddJournalQuestEntry("XP2_Name_SmansLove", 10, oPC, TRUE, TRUE);
        SetLocalString(GetModule(), "sKnower_SleepingMansLove", "Player");
        //Give non-repeatable XP
        i2daRow = 191;
        bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }

    //Return TRUE if it's selected Aribeth...
    if (sLove == "Aribeth")
    {
        return TRUE;
    }
    return FALSE;
}
