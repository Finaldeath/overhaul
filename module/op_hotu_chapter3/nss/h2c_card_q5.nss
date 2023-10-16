//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick, 5 Questions Asked (Condition Script)
//:: H2c_Card_Q5.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has already asked
     5 questions.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 17, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iQuestions = GetLocalInt(OBJECT_SELF, "iQuestionsAsked");
    if (iQuestions == 5)
    {
        return TRUE;
    }
    return FALSE;
}
