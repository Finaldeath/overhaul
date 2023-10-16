//::///////////////////////////////////////////////////////
// X0_EVT_TRIGGER
/*
  This is the OnEntered script for the henchman trigger objects.
  It signals the event router that a given event has occured,
  by obtaining the key tag from the trigger and using that as
  the event number.

  Each trigger will only be activated once, and can only be
  activated by a PC.


  MODIFIED BY BRENT, APRIL 2003
  1. Henchmen now trigger the trigger, not players
  2. Henchmen will only attempt to do the popup or intjereciton
      if the player and the henchmen meet he following requirements
        (a) Neither in combat
        (b) Neither in Conversation
        (c) Within 10 meters of each other
*/
//::///////////////////////////////////////////////////////

#include "x0_i0_common"

void main()
{   //SpawnScriptDebugger();
    if(GetLocalInt(GetModule(), "Q5_TALKED_TO_GARRICK") == 0)
        return;

    ExecuteScript("x0_evt_trigger", OBJECT_SELF);
}
