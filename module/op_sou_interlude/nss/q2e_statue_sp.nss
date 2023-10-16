void main()
{
    effect eHaste = EffectHaste();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHaste, OBJECT_SELF);
    SetLocalInt(OBJECT_SELF, "X1_L_IMMUNE_TO_DISPEL", 10);
}
