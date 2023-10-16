//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Suit Guess = Diamonds (Action Script)
//:: H2a_Card_Guess_D.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The player has guessed the card's suit as
     Diamonds. Save this out for future reference.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 18, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "iSuitGuess", 400);
}
