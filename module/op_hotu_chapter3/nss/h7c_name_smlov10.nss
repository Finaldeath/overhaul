//::///////////////////////////////////////////////
//:: The Knower of Names, Sleeping Man's Love = Player (Condition Script)
//:: H7c_Name_SMLov10.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Decides the identity of the Sleeping Man's
     one true love.

     Returns TRUE if it's the Player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    //Choose the Sleeping Man's true love:
    //  1-15%  = PC
    //  16-30% = Aribeth
    //  31-45% = Nathyrra
    //  46-60% = Sensei Dharvana
    //  61-75% = Knower of Places (CUT)
    //  76-90% = Knower of Names
    //  91-100%= Lavoera (CUT)
    int iPercent = Random(100)+1;
    int iJournal;
    string sLove;
    int i2daRow;

    //Override with the Player if the Sleeping Man has already been declared
    //her one true love.
    string sPCLove = GetLocalString(GetModule(), "sKnower_PlayersLove");
    if (sPCLove == "SleepingMan")
    {
        iPercent == 1;
    }

    //If it's selected Player...
    if (iPercent >= 1 &&
        iPercent <= 15)
    {
        //If the Player is Female, define the string
        object oPC = GetPCSpeaker();
        int iGender = GetGender(oPC);
        if (iGender == GENDER_FEMALE)
        {
            sLove = "Player";
            iJournal = 10;
            i2daRow = 191;
        }
        //If the Player is Male, default to Sensei instead
        else
        {
            sLove = "Sensei";
            iJournal = 30;
            i2daRow = 193;
        }
    }

    //If it's selected Aribeth...
    else if (iPercent >= 16 &&
             iPercent <= 30)
    {
        //Define the string if the player has learned of her existence and
        //the player has not already identified her as their own one true love.
        int bName = GetLocalInt(GetModule(), "bAribethsNameKnown");
        if (bName == TRUE &&
            sPCLove != "Aribeth")
        {
            sLove = "Aribeth";
            iJournal = 20;
            i2daRow = 192;
        }
        //If not, default to the Knower of Names
        else
        {
            sLove = "Names";
            iJournal = 60;
            i2daRow = 196;
        }
    }

    //If it's selected Nathyrra...
    else if (iPercent >= 31 &&
             iPercent <= 45)
    {
        //Define the string if Nathyrra was successfully transfered over from
        //Ch2 and the player has not already identified her as their own true
        //love.
        object oNathyrra = GetObjectByTag("x2_hen_nathyra");
        if (oNathyrra != OBJECT_INVALID &&
            sPCLove != "Nathyrra")
        {
            sLove = "Nathyrra";
            iJournal = 40;
            i2daRow = 194;
        }
        //If not, default to the Sensei
        else
        {
            sLove = "Sensei";
            iJournal = 30;
            i2daRow = 193;
        }
    }

    //If it's selected Sensei Dharvana, define the string.
    else if (iPercent >= 46 &&
             iPercent <= 60)
    {
        sLove = "Sensei";
        iJournal = 30;
        i2daRow = 193;
    }

    //If it's selected the Knower of Names, define the string.
    else if (iPercent >= 61 &&
             iPercent <= 90)
    {
        sLove = "Names";
        iJournal = 60;
        i2daRow = 196;
    }

    //If all else fails, default to Sensei.
    else
    {
        sLove = "Sensei";
        iJournal = 30;
        i2daRow = 193;
    }

    //Save out the string.
    SetLocalString(GetModule(), "sKnower_SleepingMansLove", sLove);

    //Add journal entries
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Name_SMansLove", iJournal, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    if (iJournal == 10)
    {
        AddJournalQuestEntry("XP2_Name_PlayersLove", 50, oPC, TRUE, TRUE);
        SetLocalString(GetModule(), "sKnower_PlayersLove", "SleepingMan");

        //Give non-repeatable XP
        i2daRow = 212;
        bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
}

    //Return TRUE if it's selected Player...
    if (sLove == "Player")
    {
        return TRUE;
    }
    return FALSE;
}
