void main()
{
  object oClicker = GetPCSpeaker();
  object oTarget = GetWaypointByTag("WP_M1S3C_M1S3A");
  location lLoc = GetLocation(oTarget);

 //SetAreaTransitionBMP(AREA_TRANSITION_CITY);

  AssignCommand(oClicker,JumpToLocation(lLoc));
}
