///////////////////////////////////////////////////////////////////////////////////////
// This script is designed to move the PC away from lightning door.  This is done
// so that the player is well aware that they must do something else to get through it.
//
// Created by: Brad Prince
// 9-13-02
//
///////////////////////////////////////////////////////////////////////////////////////

void main()
{
   object oPC = GetEnteringObject();
   location lLoc = GetLocation(GetWaypointByTag("move_away"));
   // This int will mark when the PC has solved the puzzle, thus letting them pass.
   int iDone = GetLocalInt(OBJECT_SELF, "done");
   object oDoor = GetNearestObjectByTag("puzzle_door");

   if(iDone != 1) {
      if(GetIsPC(oPC))
      {
        if(!GetIsOpen(oDoor))
        {
            //AssignCommand(oPC, ClearAllActions());
            //SendMessageToPC(oPC, "[NOT IN STRING EDITOR] It doesn't look like you can get through the lightning barrier.");
            SendMessageToPCByStrRef(oPC, 100774);
            //AssignCommand(oPC, ActionForceMoveToLocation(lLoc, TRUE));
        }
      }
   }
}
