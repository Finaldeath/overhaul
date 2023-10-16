//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Game Off (Action Script)
//:: H2a_Card_GameOff.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the card game as being inactive
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 16, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bCardGameActive", FALSE);
}
