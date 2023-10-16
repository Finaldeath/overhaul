//Destroy chest and everything in it when it is closed.
void main()
{
    location lSpawn1 = GetLocation(OBJECT_SELF);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_BREACH), lSpawn1);
    DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DEATH_WARD), lSpawn1));

    object oItem = GetFirstItemInInventory();
    while (GetIsObjectValid(oItem) == TRUE)
    {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory();

    }
    DestroyObject(OBJECT_SELF);
}
