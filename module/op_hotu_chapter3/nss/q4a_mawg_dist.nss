//::///////////////////////////////////////////////
//:: Name q4a_mawg_dist
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will set a journal entry for the
     PC when the goblin boss has been looted.
     This is so they have an idea about using
     the polymorph crystal.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 16, 2003
//:://////////////////////////////////////////////

void main()
{
   object oItem = GetInventoryDisturbItem();
   object oPC = GetLastDisturbed();

   if(GetTag(oItem) == "q4a_morph")
      AddJournalQuestEntry("q4a_mawg", 10, oPC);
}
