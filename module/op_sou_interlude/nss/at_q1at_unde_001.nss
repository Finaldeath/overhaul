void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);

  object oZidan = GetNearestObjectByTag("Q1_ZIDAN");
  if(GetLocalObject(oZidan, "Q1_FOLLOW") == oClicker)
       AssignCommand(oZidan, JumpToObject(oTarget));
  AssignCommand(oClicker,JumpToObject(oTarget));
}
