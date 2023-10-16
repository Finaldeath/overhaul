//* Water Elemental Leaves
void main()
{
    DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEALING_M),GetLocation(OBJECT_SELF)));
    DestroyObject(OBJECT_SELF,2.0);
}

