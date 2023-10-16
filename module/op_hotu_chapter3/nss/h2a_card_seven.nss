//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Is Card a Seven? (Action Script)
//:: H2a_Card_Seven.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Determines whether or not the card is a Seven
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
    int bSeven = FALSE;

    //If value ends in "07", it's a Seven
    string sCardDrawn = IntToString(iCardDrawn);
    string sValueDrawn = GetStringRight(sCardDrawn, 2);
    if (sValueDrawn == "07")
    {
        bSeven = TRUE;
    }

    //Decide if he's telling the truth and save it out for future reference.
    int bTruth = Random(2);
    SetLocalInt(OBJECT_SELF, "bTellingTruth", bTruth);

    //Determine the answer he's going to give, based on the above results, and
    //save it out for future reference.
    int bAnswer;
    if (bSeven == bTruth)
    {
        bAnswer = TRUE;
    }
    if (bSeven != bTruth)
    {
        bAnswer = FALSE;
    }
    SetLocalInt(OBJECT_SELF, "bAnswer", bAnswer);
}


