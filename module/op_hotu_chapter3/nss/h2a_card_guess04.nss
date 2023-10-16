//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Value Guess = Four (Action Script)
//:: H2a_Card_Guess04.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The player has guessed the card's value as a
     Four. Save this out for future reference.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 18, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "iValueGuess", 4);
}
