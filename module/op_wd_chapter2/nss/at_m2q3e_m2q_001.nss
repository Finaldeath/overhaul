void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);

  if (GetLocalInt(GetModule(),"NW_G_CharwoodEntered") == 0)
  {
    SetLocalInt(GetModule(),"NW_G_CharwoodEntered",10);
  }
  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

  AssignCommand(oClicker,JumpToLocation(lLoc));
}
