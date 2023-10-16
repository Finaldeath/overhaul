void main()
{
    location lLoc = GetLocation(GetNearestObjectByTag("WP_M1Q5EMummy"));
    effect eVis = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
    object oMummy = CreateObject(OBJECT_TYPE_CREATURE,"NW_MUMMY",GetLocation(OBJECT_SELF));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,GetLocation(oMummy));
}
