void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);

  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
  SetLocked(GetObjectByTag("M1Q3AMeldGate"),FALSE);
  if (GetIsPC(oClicker) || GetIsPC(GetMaster(oClicker)) == TRUE)
  {
      AssignCommand(oClicker,JumpToObject(oTarget));
  }
  else
  {
    AssignCommand(oClicker, ClearAllActions());
  }
}
