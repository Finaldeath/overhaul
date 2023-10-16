//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Value Guess = Jack (Action Script)
//:: H2a_Card_Guess11.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The player has guessed the card's value as a
     Jack. Save this out for future reference.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 18, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "iValueGuess", 11);
}
