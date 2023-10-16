void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);


  SetLocalObject(oTarget, "DEST", OBJECT_SELF);
  AssignCommand(oClicker,JumpToObject(oTarget));
}
