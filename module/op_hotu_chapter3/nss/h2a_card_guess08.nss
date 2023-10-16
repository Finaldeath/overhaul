//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Value Guess = Eight (Action Script)
//:: H2a_Card_Guess08.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The player has guessed the card's value as an
     Eight. Save this out for future reference.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 18, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "iValueGuess", 8);
}
