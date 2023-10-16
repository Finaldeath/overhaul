//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick, Pay 100,000 gp (Action Script)
//:: H2a_Card_100000.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player gives 100,000 gp the NPC
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    TakeGoldFromCreature(100000, oPC);
}
