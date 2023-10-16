//::///////////////////////////////////////////////
//:: q2aArgaliInvx
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Marks that the player has asked talked to Argali
   and her inventory and war being good for business
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////

void main()
{
  SetLocalInt(GetPCSpeaker(),"Argali_Inventory",1);
}

