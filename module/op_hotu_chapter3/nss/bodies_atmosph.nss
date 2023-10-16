////////////////////////////////////////////////////////////////////////////////////////////
// This script provides some context for the story. It will also update the PC's
// journal.
//
// Created by: Brad Prince
// 9-13-02
//
////////////////////////////////////////////////////////////////////////////////////////////

void main()
{
   object oPC = GetEnteringObject();
   int iSeenThis = GetLocalInt(oPC, "body_piles");

   if(iSeenThis != 1) {
      if(GetIsPC(oPC)) {
         SetLocalInt(oPC, "body_piles", 1);
         //AssignCommand(oPC, SpeakString("[NOT IN STRING EDITOR] For the love of all things sacred! Look at these bodies everywhere."));
         AddJournalQuestEntry("podunk", 10, oPC, FALSE, FALSE);
      }
   }
}
