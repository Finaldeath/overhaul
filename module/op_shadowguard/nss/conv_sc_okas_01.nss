void main()
{
    object oPC = GetPCSpeaker();

    object oWP;
    location lWP;
    effect e;

    oWP = GetNearestObjectByTag("WP_OKAR_ASSA_01", oPC);
    lWP = GetLocation(oWP);
    e = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, lWP);
}
