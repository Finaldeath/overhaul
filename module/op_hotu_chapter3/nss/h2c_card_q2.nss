//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick, 2 Questions Asked (Condition Script)
//:: H2c_Card_Q2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has already asked
     2 questions.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 17, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iQuestions = GetLocalInt(OBJECT_SELF, "iQuestionsAsked");
    if (iQuestions == 2)
    {
        return TRUE;
    }
    return FALSE;
}
