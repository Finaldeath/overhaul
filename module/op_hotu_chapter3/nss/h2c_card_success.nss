//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick Successful Guess (Condition Script)
//:: H2c_Card_Success.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player guessed the card
     correctly.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 18, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    int iCard = GetLocalInt(OBJECT_SELF, "iCardDrawn");
    int iValueGuess = GetLocalInt(OBJECT_SELF, "iValueGuess");
    int iSuitGuess = GetLocalInt(OBJECT_SELF, "iSuitGuess");

    //If the Drawn Card equals the sum of the Suit and Value Guesses, then the
    //player has guessed correctly.
    if (iCard == iValueGuess + iSuitGuess)
    {
        //Add the Trumpet of Pandemonium to the Card Table.
        object oTrumpet = GetItemPossessedBy(OBJECT_SELF, "H2_Trumpet");
        object oTable = GetObjectByTag("H2_CardTable");
        ActionGiveItem(oTrumpet, oTable);

        //Add the journal entry
        object oPC = GetPCSpeaker();
        AddJournalQuestEntry("XP2_Arden", 50, oPC, TRUE, TRUE);

        //Give non-repeatable XP
        int i2daRow = 74;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }

        //Set a victory local
        SetLocalInt(GetModule(), "bWonTrumpet", TRUE);

        //Return TRUE.
        return TRUE;
    }
    return FALSE;
}
