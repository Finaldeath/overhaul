void main()
{
    effect eVis = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF));
    CreateObject(OBJECT_TYPE_CREATURE, "nw_oldwoman001", GetLocation(OBJECT_SELF));
    DestroyObject(OBJECT_SELF, 0.1);
}
