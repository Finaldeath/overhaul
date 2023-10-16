void main()
{
    object oSelf = OBJECT_SELF;
    if(GetLocalInt(OBJECT_SELF,"Generic_Surrender") == 3 ||
       GetLocalInt(OBJECT_SELF,"NW_FORMOSA_JOB") ==2)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_UNSUMMON),oSelf);
        DestroyObject(oSelf,2.0);
    }
}
