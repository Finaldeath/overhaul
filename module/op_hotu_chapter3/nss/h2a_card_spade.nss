//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Is Card a Spade? (Action Script)
//:: H2a_Card_Spade.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Determines whether or not the card is a Spade
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
    int bSpade = FALSE;

    //If value is greater than 200 but less than 300, it's a Spade
    if (iCardDrawn > 200 &&
        iCardDrawn < 300)
    {
        bSpade = TRUE;
    }

    //Decide if he's telling the truth and save it out for future reference.
    int bTruth = Random(2);
    SetLocalInt(OBJECT_SELF, "bTellingTruth", bTruth);

    //Determine the answer he's going to give, based on the above results, and
    //save it out for future reference.
    int bAnswer;
    if (bSpade == bTruth)
    {
        bAnswer = TRUE;
    }
    if (bSpade != bTruth)
    {
        bAnswer = FALSE;
    }
    SetLocalInt(OBJECT_SELF, "bAnswer", bAnswer);
}


