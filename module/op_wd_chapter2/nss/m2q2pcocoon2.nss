void main()
{
    location lSpawn = GetLocation(OBJECT_SELF);
    effect eWeb = EffectVisualEffect(VFX_DUR_WEB);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eWeb, OBJECT_SELF, RoundsToSeconds(1));
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q2CTROLLHENCH",lSpawn);
    DestroyObject(OBJECT_SELF);
}
