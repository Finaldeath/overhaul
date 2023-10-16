void main()
{
    SetIsDestroyable(FALSE, FALSE, FALSE);
    //ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDeath(), OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectKnockdown(), OBJECT_SELF);
}
