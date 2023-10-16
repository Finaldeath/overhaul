///////////////////////////////////////////////////////////////////////////////////////
// This script gives the player some insight for the gong puzzle when they step on the
// trigger it is on.
//
// Created by: Brad Prince
// 9-13-02
//
///////////////////////////////////////////////////////////////////////////////////////

void main()
{
   object oPC = GetEnteringObject();
   object oPortal = GetObjectByTag("gong_statue");
   int iSeenThis = GetLocalInt(oPC, "seen_this_statue");

   if(iSeenThis != 1) {
      if(GetIsPC(oPC)) {
         SetLocalInt(oPC, "seen_this_statue", 1);
         AddJournalQuestEntry("gargoyle", 40, oPC, FALSE, FALSE);
         //AssignCommand(oPC, SpeakString("[NOT IN STRING EDITOR] Another Gargoyle Statue? And this one has its ears broken off."));
      }
   }
}
