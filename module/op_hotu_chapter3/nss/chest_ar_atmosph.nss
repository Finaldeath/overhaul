/////////////////////////////////////////////////////////////////////////////////////////
// This script will give a bit of atmosphere for the arrow segment that deals with
// locking and unlocking the door or the chests when it points to them.
//
// Created by: Brad Prince
// 9-13-02
//
/////////////////////////////////////////////////////////////////////////////////////////

void main()
{
   object oPC = GetEnteringObject();
   object oPortal = GetObjectByTag("chests_arrow");
   int iSeenThis = GetLocalInt(oPC, "chests_arrow");

   if(iSeenThis != 1) {
      if(GetIsPC(oPC)) {
         SetLocalInt(oPC, "chests_arrow", 1);
         //AssignCommand(oPC, ClearAllActions());
         //DelayCommand(1.0, AssignCommand(oPC, SetFacingPoint(GetPosition(oPortal))));
         //AssignCommand(oPC, SpeakString("[NOT IN STRING EDITOR] Oh no, not another arrow..."));
      }
   }
}
