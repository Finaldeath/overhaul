void main()
{
  object oidEntered = GetClickingObject();
  object oidWaypoint = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oidWaypoint);

  SetAreaTransitionBMP(AREA_TRANSITION_CITY);

  AssignCommand(oidEntered,ClearAllActions());
  AssignCommand(oidEntered,ActionJumpToLocation(lLoc));
  AssignCommand(oidEntered,SetFacing(GetFacing(oidWaypoint)));
}
