void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);
  if(GetLocalInt(GetModule(),"NW_G_M1S2MaskClosed"))
     lLoc = GetLocation(GetWaypointByTag("WP_M1Q1A3_M1S2A3_NEW"));
  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

  AssignCommand(oClicker,JumpToLocation(lLoc));
}
