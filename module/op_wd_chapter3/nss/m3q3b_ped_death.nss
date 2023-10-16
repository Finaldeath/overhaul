void main()
{
    object oPedastal = GetNearestObjectByTag("M3Q3B_FIRE_PEDASTAL_02");
    if(!GetIsObjectValid(oPedastal))
    {
        object oBrazier = GetObjectByTag("M3Q3B_FIRE_SPAWN_02");
        location lLocal = GetLocation(oBrazier);
        SetPlotFlag(oBrazier,FALSE);
        DelayCommand(1.4, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lLocal));
        DestroyObject(oBrazier, 1.0);
    }
}
