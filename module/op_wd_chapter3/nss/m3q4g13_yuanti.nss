// * Yuan-ti follows player around until certain conditions are met
// * Will probably lay triggers around areas that should turn the yuan-ti
// * hostile if crossed
void main()
{
    // * if a direct signal or  a heartbeat fires
    if (GetUserDefinedEventNumber() == 2050 || GetUserDefinedEventNumber() == 1001 || GetUserDefinedEventNumber() ==1003)
    { // SpeakString("in user defined");
      if (GetLocalInt(GetModule(),"NW_G_M3Q04PLOTYUANTI") ==1)
      {
        ActionMoveToObject(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), TRUE);
      }
      else
      // * do the change
      if (GetLocalInt(GetModule(),"NW_G_M3Q04PLOTYUANTI") ==2 && GetLocalInt(OBJECT_SELF, "NW_L_ICHANGED") == 0)
      {
       // SetLocalInt(GetModule(),"NW_G_M3Q04PLOTYUANTI", 3);

        ExecuteScript("M3Q04G13YUAN",OBJECT_SELF);

      }
  }
}
