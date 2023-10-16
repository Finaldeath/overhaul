void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);

  SetAreaTransitionBMP(AREA_TRANSITION_FOREST);

    DestroyObject(GetObjectByTag("M2Q2CNYMPHF"));
  AssignCommand(oClicker,JumpToLocation(lLoc));
}
