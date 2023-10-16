void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  location lLoc = GetLocation(oTarget);

  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

  AssignCommand(oClicker,ActionJumpToLocation(lLoc));
  AssignCommand(oClicker,ActionDoCommand(ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_MAGIC_PROTECTION),lLoc)));
}
