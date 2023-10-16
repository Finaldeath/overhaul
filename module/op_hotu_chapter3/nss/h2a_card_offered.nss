//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Card Trick Offered (Action Script)
//:: H2a_Card_Offered.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having been offered the
     card trick.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 18, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "bCardsOffered", TRUE);
}
