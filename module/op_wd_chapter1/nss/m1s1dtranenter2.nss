void main()
{
  object oClicker = GetEnteringObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);

  SetAreaTransitionBMP(AREA_TRANSITION_CITY);

  AssignCommand(oClicker,JumpToLocation(lLoc));
}
