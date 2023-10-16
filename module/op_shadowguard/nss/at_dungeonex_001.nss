
void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);

  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

  AssignCommand(oClicker,JumpToObject(oTarget));
}
