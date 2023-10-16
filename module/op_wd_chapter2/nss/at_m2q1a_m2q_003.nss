void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);
  object oPortal = GetObjectByTag("M2Q1_NEURIKPORT");
  object oDoor = GetObjectByTag("M2Q1P_M2Q1A");
  location lPortal = GetLocation(oPortal);
  location lLoc = GetLocation(oTarget);

  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

  DelayCommand(1.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_STRIKE_HOLY),lPortal));
  AssignCommand(oClicker,ActionMoveToObject(oPortal,FALSE,0.1));
  AssignCommand(oClicker,DelayCommand(2.0,JumpToLocation(lLoc)));
  AssignCommand(oDoor,DelayCommand(2.0,ActionOpenDoor(oDoor)));
}
