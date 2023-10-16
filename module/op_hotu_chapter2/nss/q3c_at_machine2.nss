// Trying to grab the crystal from the machine: zap the pc

void main()
{
    effect eKnock = EffectKnockdown();
    effect eDamage = EffectDamage(d6(6), DAMAGE_TYPE_NEGATIVE, DAMAGE_POWER_ENERGY);
    effect eVis = EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY);
    effect eLink = EffectLinkEffects(eVis, eDamage);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, GetPCSpeaker());
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, GetPCSpeaker(), 2.0);
}
