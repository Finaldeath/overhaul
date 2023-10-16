void main()
{
    int iDoOnce = GetLocalInt(OBJECT_SELF, "iDoOnce");

    if (iDoOnce == FALSE)
    {
        effect eVFX1 = EffectVisualEffect(VFX_DUR_ELEMENTAL_SHIELD);
        effect eVFX2 = EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR );
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX1, OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX2, OBJECT_SELF);
        SetLocalInt(OBJECT_SELF, "iDoOnce", TRUE);
    }
}
