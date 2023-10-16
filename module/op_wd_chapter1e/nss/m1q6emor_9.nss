void main()
{
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
    effect eVis2 = EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eVis2,OBJECT_SELF);

}
