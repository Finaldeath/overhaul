void main()
{
    effect eDebris = EffectVisualEffect(353);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDebris, OBJECT_SELF);
    DestroyObject(OBJECT_SELF);
}
