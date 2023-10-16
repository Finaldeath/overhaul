void main()
{
    object oInvis2;
    int x = 0;
    object oPed = GetObjectByTag("Pedestal", x);
    object oInvis = GetObjectByTag("invis");

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_SPELLTURNING), oInvis);

    while(GetIsObjectValid(oPed))
    {
        oInvis2 = GetNearestObjectByTag("invis2", oPed);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_LIGHTNING, oPed, BODY_NODE_CHEST), oInvis2);
        x = x + 1;
        oPed = GetObjectByTag("Pedestal", x);
    }
}
