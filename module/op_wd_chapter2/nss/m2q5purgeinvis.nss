void main()
{
    object oEntered = GetEnteringObject();
    location lEntered = GetLocation(oEntered);

    if (GetTag(oEntered) == "M2Q05CSTALKER")
    {
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_LIGHTNING_M),lEntered);
        DelayCommand(1.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_DISPEL_DISJUNCTION),lEntered));
        DestroyObject(oEntered);
    }
}
