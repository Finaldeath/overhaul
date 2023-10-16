//::///////////////////////////////////////////////
//:: q2awhiterod
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Gives the player White Thesta's rod of resurrection,
  marks that the rod is given away
*/
//:://////////////////////////////////////////////
//:: Created By:Drew Karpyshyn
//:: Created On:  July 23, 2003
//:://////////////////////////////////////////////

void main()
{
   CreateItemOnObject("x2_rodresurrect",GetPCSpeaker());
   SetLocalInt(GetModule(),"RodRessurect",10);

}
