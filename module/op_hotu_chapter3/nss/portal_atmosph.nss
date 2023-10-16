//////////////////////////////////////////////////////////////////////////////////////
// This script is used on a trigger to give the PC an idea that something needs to
// be done to make the portal appear.
//
// Created by: Brad Prince
// 9-13-02
//
//////////////////////////////////////////////////////////////////////////////////////

void main()
{
   object oPC = GetEnteringObject();
   object oPortal = GetObjectByTag("portal_invis");
   int iSeenThis = GetLocalInt(oPC, "seen_this");

   if(iSeenThis != 1) {
      if(GetIsPC(oPC)) {
         SetLocalInt(oPC, "seen_this", 1);
         AssignCommand(oPC, ClearAllActions());
         DelayCommand(1.0, AssignCommand(oPC, SetFacingPoint(GetPosition(oPortal))));
         //DelayCommand(2.2, AssignCommand(oPC, SpeakString("[NOT IN STRING EDITOR] Looks like a dead end here.")));
      }
   }
}
