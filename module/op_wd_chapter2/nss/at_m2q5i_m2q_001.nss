void main()
{
  object oEntered = GetEnteringObject();

  SetAreaTransitionBMP(AREA_TRANSITION_CRYPT);

  AssignCommand(oEntered,JumpToLocation(GetLocation(GetWaypointByTag("WP_M2Q5HPortal"))));
}
