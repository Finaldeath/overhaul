void main()
{

    int nLocal = GetLocalInt(OBJECT_SELF, "NW_2Q4_KURTH_SPAWN");
    if(nLocal == 0)
    {
        effect eVis = EffectVisualEffect(VFX_DUR_BLUR);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, OBJECT_SELF, HoursToSeconds(99));
        effect eVis2 = EffectVisualEffect(VFX_DUR_GLOBE_INVULNERABILITY);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis2, OBJECT_SELF);
        SetLocalInt(OBJECT_SELF, "NW_2Q4_KURTH_SPAWN", 1);
    }
}
