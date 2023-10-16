//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Draw Card (Action Script)
//:: H2a_Card_Draw.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Picks a card and saves it out as a local int.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 17, 2003
//:://////////////////////////////////////////////

void main()
{
    //Randomly pick the card's value (Ace = 1, King = 13).
    int iValue = Random(13)+1;

    //Randomly pick the card's suit (Clubs = 100, Spades = 200, Hearts = 300,
    //Diamonds = 400)
    int iSuit = (Random(4)+1)*100;

    //Add them together so it can be stored as a single value.
    int iCardDrawn = iValue + iSuit;

    //Save it out on the NPC for future reference
    SetLocalInt(OBJECT_SELF, "iCardDrawn", iCardDrawn);

    //Wipe the Question Counter as this is the start of a new game.
    SetLocalInt(OBJECT_SELF, "iQuestionsAsked", 0);

/*DEBUG*///SendMessageToPC(GetPCSpeaker(), "DEBUG: Card drawn = "+IntToString(iCardDrawn));
}
