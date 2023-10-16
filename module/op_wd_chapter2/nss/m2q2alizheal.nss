void main()
{
  effect eHeal = EffectHeal(40);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, OBJECT_SELF);
}
