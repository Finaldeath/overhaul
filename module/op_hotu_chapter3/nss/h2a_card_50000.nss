//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick, Pay 50,000 gp (Action Script)
//:: H2a_Card_50000.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player gives 50,000 gp the NPC
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    TakeGoldFromCreature(50000, oPC);
}
