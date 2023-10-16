// * creature starts out dead
void main()
{
    SetIsDestroyable(FALSE, TRUE, FALSE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectDeath(), OBJECT_SELF);
}
