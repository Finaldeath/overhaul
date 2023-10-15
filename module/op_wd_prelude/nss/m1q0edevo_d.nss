void main()
{
    ApplyEffectToObject(DURATION_TYPE_INSTANT,
                        EffectVisualEffect(VFX_IMP_UNSUMMON),
                        OBJECT_SELF);
    DestroyObject(OBJECT_SELF,0.5);
}
