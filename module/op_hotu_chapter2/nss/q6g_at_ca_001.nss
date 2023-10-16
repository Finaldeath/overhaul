
void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);

  if(GetLocalInt(GetModule(), "q6_city_gone") == 1)
  {
    object oPC = GetClickingObject();
    AssignCommand(oPC, SpeakOneLinerConversation("q6_empty_cave"));
    return;
  }
  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

  AssignCommand(oClicker,JumpToObject(oTarget));
}
