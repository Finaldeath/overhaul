//* Move's the player into the Wizard's Dungeon (from Coldwood)
void main()
{
  object oClicker = GetEnteringObject();
  if (GetIsObjectValid(oClicker) == FALSE)
  {
    //AssignCommand(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), SpeakString("no clicker"));
  }
//  AssignCommand(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), SpeakString("fired"));
  object oTarget = GetObjectByTag("WP_Wizardsdungeoninside");
  location lLoc = GetLocation(oTarget);
  object oItem = GetItemPossessedBy(oClicker, "M3ALL_MAGSCROLL");

  if(GetIsObjectValid(oItem) == TRUE)
  { //   AssignCommand(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), SpeakString("13"));
    SetLocalInt(OBJECT_SELF, "NW_TELEPORT_STATUS", TRUE);
    CreateObject(OBJECT_TYPE_PLACEABLE, "PLC_SOLRED", GetLocation(GetWaypointByTag("M3Q3_ACTIVE_01")));
    CreateObject(OBJECT_TYPE_PLACEABLE, "PLC_SOLRED", GetLocation(GetWaypointByTag("M3Q3_ACTIVE_02")));
    DestroyObject(oItem, 1.0);
  }
  else
  {
    ActionSpeakStringByStrRef(67262);
  }
  if(GetLocalInt(OBJECT_SELF, "NW_TELEPORT_STATUS") == TRUE)
  {
     // AssignCommand(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), SpeakString("21"));

    AssignCommand(oClicker,JumpToLocation(lLoc));
  }
}
