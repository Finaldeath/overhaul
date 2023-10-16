void main()
{
    object oPC = GetLocalObject(OBJECT_SELF,"NW_A_TRANSPORT_PC");
    location lPC = GetLocation(oPC);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_GOOD_HELP),lPC);
    DelayCommand(1.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_UNSUMMON),lPC));
    DelayCommand(1.5,AssignCommand(oPC,JumpToLocation(GetLocation(GetWaypointByTag("WP_M2Q5Q_M2Q5P")))));
}
