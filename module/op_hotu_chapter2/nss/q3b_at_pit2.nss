// Use a rope to go down the pit

void main()
{
    object oPC = GetPCSpeaker();
    location lLoc = GetLocation(GetObjectByTag("q3c_wp_fall"));
    int nDamage = Random(30) + 6;
    effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_BLUDGEONING);
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC));
    effect eKnock = EffectKnockdown();
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oPC, 8.0));
    AssignCommand(oPC, JumpToLocation(lLoc));
}
