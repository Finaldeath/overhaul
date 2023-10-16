// * returns player back to the other sourcestone level
void main()
{
  object oPC = GetLastUsedBy();
  object oTarget = GetObjectByTag("WP_M4INNERSANCTUM");

    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
    location lPC = GetLocation(oPC);
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, lPC);


  DelayCommand(3.0,AssignCommand(oPC,JumpToObject(oTarget)));
}
