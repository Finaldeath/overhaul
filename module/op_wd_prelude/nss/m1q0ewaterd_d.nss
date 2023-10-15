void main()
{
    if(GetUserDefinedEventNumber() == 50)
    {
        ClearAllActions();
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_UNSUMMON),OBJECT_SELF);
        DestroyObject(OBJECT_SELF,1.0);
    }
}
