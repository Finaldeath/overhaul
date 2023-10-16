//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick, Pay 250,000 gp (Action Script)
//:: H2a_Card_250000.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player gives 250,000 gp the NPC
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    TakeGoldFromCreature(250000, oPC);
}
