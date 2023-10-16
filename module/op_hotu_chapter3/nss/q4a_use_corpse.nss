//::///////////////////////////////////////////////
//:: Name q4a_use_corpse
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script is for the corpse near the
     mine shaft that will give the player the
     option of climbing down.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 3, 2003
//:://////////////////////////////////////////////

void main()
{
   object oPC = GetLastUsedBy();

   if(GetIsPC(oPC))
      ActionStartConversation(oPC, "q4a_corpse");
}
