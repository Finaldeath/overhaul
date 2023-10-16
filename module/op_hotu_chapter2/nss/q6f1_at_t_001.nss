
void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  if(GetStringLeft(GetTag(oClicker), 2) == "q6")
    return;
  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

  AssignCommand(oClicker,JumpToObject(oTarget));
}
