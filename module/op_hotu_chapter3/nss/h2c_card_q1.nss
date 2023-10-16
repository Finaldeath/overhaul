//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick, 1 Question Asked (Condition Script)
//:: H2c_Card_Q1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has already asked
     1 question.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 17, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iQuestions = GetLocalInt(OBJECT_SELF, "iQuestionsAsked");
    if (iQuestions == 1)
    {
        return TRUE;
    }
    return FALSE;
}
