// burn anyone inside the fire

void main()
{
    object oEnter = GetFirstInPersistentObject();
    effect eDam = EffectDamage(d6() * 3);
    effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);
    effect eLink = EffectLinkEffects(eDam, eVis);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oEnter);
}
