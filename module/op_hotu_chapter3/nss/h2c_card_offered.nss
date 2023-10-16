//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Card Trick Offered (Condition Script)
//:: H2c_Card_Offered.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has been offered
     the card trick.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 18, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bOffered = GetLocalInt(OBJECT_SELF, "bCardsOffered");
    int bKnown = GetLocalInt(GetModule(), "bArdensPlansKnown");

    if (bOffered == TRUE ||
        bKnown == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
