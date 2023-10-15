void main()
{
    ActionDoCommand(SetIsDestroyable(FALSE));
    ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDeath(),OBJECT_SELF));
}
