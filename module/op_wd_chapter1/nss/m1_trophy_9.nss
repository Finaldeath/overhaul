void main()
{
    effect ePar = EffectParalyze();
    effect eDeath = EffectDeath();
    SetIsDestroyable(FALSE,FALSE,FALSE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,ePar,OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath,OBJECT_SELF);
}
