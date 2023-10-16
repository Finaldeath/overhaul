//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Is Card a Nine? (Action Script)
//:: H2a_Card_Nine.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Determines whether or not the card is a Nine
     and whether or not the NPC is going to tell
     the truth. The resulting answer is saved out
     on the NPC for future reference.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 17, 2003
//:://////////////////////////////////////////////

void main()
{
    int iCardDrawn = GetLocalInt(OBJECT_SELF, "iCardDrawn");
    int bNine = FALSE;

    //If value ends in "09", it's a Nine
    string sCardDrawn = IntToString(iCardDrawn);
    string sValueDrawn = GetStringRight(sCardDrawn, 2);
    if (sValueDrawn == "09")
    {
        bNine = TRUE;
    }

    //Decide if he's telling the truth and save it out for future reference.
    int bTruth = Random(2);
    SetLocalInt(OBJECT_SELF, "bTellingTruth", bTruth);

    //Determine the answer he's going to give, based on the above results, and
    //save it out for future reference.
    int bAnswer;
    if (bNine == bTruth)
    {
        bAnswer = TRUE;
    }
    if (bNine != bTruth)
    {
        bAnswer = FALSE;
    }
    SetLocalInt(OBJECT_SELF, "bAnswer", bAnswer);
}


