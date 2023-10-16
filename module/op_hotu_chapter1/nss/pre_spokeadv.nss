//::///////////////////////////////////////////////
//:PRE_SPOKEADV
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Marks that the player has spoken to the
     adventuring henchmen
     (Tomi, Linu, Sharwyn, Daelen)
*/
//:://////////////////////////////////////////////
//:: Created By:Drew Karpyshyn
//:: Created On: July 28
//:://////////////////////////////////////////////
void main()
{
  SetLocalInt(GetModule(), "PRE_SPOKE_ADVENTURERS",1);
}
