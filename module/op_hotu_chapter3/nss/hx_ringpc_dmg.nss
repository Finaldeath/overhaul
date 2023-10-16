void main()
{
//Damage the player for trying to put the ring together wrong.
    object oPC = GetPCSpeaker();
    int iDamage = Random(30)+15;
    effect eDamage = EffectDamage(iDamage, DAMAGE_TYPE_ELECTRICAL, DAMAGE_POWER_ENERGY);
    effect eKnockdown = EffectKnockdown();
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnockdown, oPC, 3.0);
}
