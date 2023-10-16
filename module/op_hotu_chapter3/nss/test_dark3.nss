void main()
{
    if(GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_LIGHT_WHITE_5), OBJECT_SELF);
    }
}
