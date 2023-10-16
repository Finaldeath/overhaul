//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Game On (Action Script)
//:: H2a_Card_GameOn.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the card game as being active
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 16, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bCardGameActive", TRUE);
}
