void main()
{
    effect eDeath = EffectDeath(TRUE,FALSE);
    effect eLink = EffectLinkEffects(EffectVisualEffect(VFX_FNF_FIREBALL),eDeath);
    SetPlotFlag(OBJECT_SELF,FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eLink,OBJECT_SELF);
}
