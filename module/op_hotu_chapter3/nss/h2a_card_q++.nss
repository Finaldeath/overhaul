//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Increment Question Count (Action Script)
//:: H2a_Card_Q++.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Increment the counter tracking the number of
     questions the player has asked.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 17, 2003
//:://////////////////////////////////////////////

void main()
{
    int iQuestions = GetLocalInt(OBJECT_SELF, "iQuestionsAsked");
    iQuestions++;
    SetLocalInt(OBJECT_SELF, "iQuestionsAsked", iQuestions);
}
