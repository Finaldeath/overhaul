void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);
  if(GetLocalInt(OBJECT_SELF,"NW_G_M1Q5D01WardDown"))
  {
    SetLocalInt(OBJECT_SELF,"NW_G_M1Q5D01WardDown",TRUE);
    SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
    AssignCommand(oClicker,JumpToObject(oTarget));
  }
  else
  {
    ActionStartConversation(oClicker,"M1Q5D01Door");
  }

}
