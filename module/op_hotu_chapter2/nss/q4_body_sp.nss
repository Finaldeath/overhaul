// spawn a dead bodu

void main()
{
    SetIsDestroyable(FALSE, FALSE, TRUE);
    effect eDeath = EffectDeath();
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, OBJECT_SELF);
}
