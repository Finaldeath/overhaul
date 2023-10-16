void main()
{
    if(GetUserDefinedEventNumber() == 1005 ||
       GetUserDefinedEventNumber() == 1006)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_PULSE_HOLY),OBJECT_SELF);
        DestroyObject(OBJECT_SELF,1.0f);
    }
}
