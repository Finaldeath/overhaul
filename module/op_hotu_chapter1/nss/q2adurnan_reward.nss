//::///////////////////////////////////////////////
//:: q2adurnan_reward
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Durnan gives the player a reward
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////

void main()
{
  int iGold = 3000 + (1000 *  GetHitDice(GetPCSpeaker()));

  GiveGoldToCreature(GetPCSpeaker(),iGold);
}
