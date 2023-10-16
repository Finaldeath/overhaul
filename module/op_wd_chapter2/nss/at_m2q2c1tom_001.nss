void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
if(GetLocalInt(GetModule(),"M2Q2WaterLever") == 1)
    {
      oTarget = GetWaypointByTag("WP_M2Q2C2BtoM2Q2C1");
    }
  location lLoc = GetLocation(oTarget);

  SetAreaTransitionBMP(AREA_TRANSITION_CRYPT);

  AssignCommand(oClicker,JumpToLocation(lLoc));
}
