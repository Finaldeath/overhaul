void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if(nEvent = 1001)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SLEEP), OBJECT_SELF);
    }
}
