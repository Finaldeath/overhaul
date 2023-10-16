void main()
{
    effect eExplode = EffectVisualEffect(VFX_FNF_SOUND_BURST);
    effect eFire = EffectVisualEffect(VFX_IMP_FROST_S);
    effect eDam = EffectDamage(10, DAMAGE_TYPE_COLD);
    location lLocal = GetLocation(GetWaypointByTag("WP_M2Q2C1_COLD"));

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, lLocal);

    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 10.0, lLocal);
    while (GetIsObjectValid(oTarget))
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eFire, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, 10.0, lLocal);
    }
}
