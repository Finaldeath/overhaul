void main()
{
  object oPC = GetPCSpeaker();
  object oTarget = GetWaypointByTag("WP_M2Q2F2SPIRIT");
  location lLoc = GetLocation(oTarget);

  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

  ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUNBEAM),GetLocation(oPC));
  DelayCommand(1.0,AssignCommand(oPC,JumpToLocation(lLoc)));
}
