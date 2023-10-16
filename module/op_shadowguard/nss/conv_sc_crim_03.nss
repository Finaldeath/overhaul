void main()
{
    effect e;
    object oCP = GetNearestObjectByTag("CT_UNIQ_NT_CRIM");
    location lWP = GetLocation(oCP);

    e = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, lWP);

    e = EffectVisualEffect(VFX_FNF_SUMMON_GATE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, lWP);

    DestroyObject(oCP);
}
