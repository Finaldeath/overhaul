//::///////////////////////////////////////////////
//:: Name q4a_dontrigger
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will cause Donan to speak to the
     first PC that enters the area.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 9, 2003
//:://////////////////////////////////////////////

void main()
{
   object oPC = GetEnteringObject();
   object oDonan = GetObjectByTag("q4a_donan");

   if(GetIsPC(oPC)) {
      AssignCommand(oDonan, ActionStartConversation(oPC));
      DestroyObject(OBJECT_SELF);
   }
}
