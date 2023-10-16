//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Value Guess = Ace (Action Script)
//:: H2a_Card_Guess01.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The player has guessed the card's value as an
     Ace. Save this out for future reference.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 18, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "iValueGuess", 1);
}
