// destroy spider agg sacs throug dialog

void main()
{
    effect eDam = EffectDamage(1000);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, OBJECT_SELF);
}
