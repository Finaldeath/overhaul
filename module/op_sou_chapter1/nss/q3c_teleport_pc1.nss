// teleport pc to inside the caves

void main()
{
    object oPC = GetLastSpellCaster();
    effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    object oWP = GetWaypointByTag("wp_q7jnah_secret_lairent");
    DelayCommand(2.0, AssignCommand(oPC, JumpToObject(oWP)));

}
