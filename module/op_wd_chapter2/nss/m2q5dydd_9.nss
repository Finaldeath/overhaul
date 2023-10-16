void main()
{
    SetIsDestroyable(FALSE,FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(GetMaxHitPoints()),OBJECT_SELF);
}
