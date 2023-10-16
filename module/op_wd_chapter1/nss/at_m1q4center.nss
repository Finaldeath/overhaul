void main()
{
  object oClicker = GetEnteringObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  //location lLoc = GetLocation(oTarget);

  AssignCommand(oClicker,JumpToObject(oTarget));
}
