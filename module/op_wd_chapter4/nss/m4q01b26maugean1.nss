///// Die at end of conversation
void main()
{
    effect edeath = EffectDeath();
    ApplyEffectToObject(DURATION_TYPE_INSTANT, edeath, OBJECT_SELF);
}

