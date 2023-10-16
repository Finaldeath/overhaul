void main()
{
    effect eDeath = EffectDeath();
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, OBJECT_SELF);
    effect eWeb = EffectVisualEffect(VFX_DUR_WEB);
    int nRand = Random(2);
    //if(nRand == 0)
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eWeb, OBJECT_SELF);
}
