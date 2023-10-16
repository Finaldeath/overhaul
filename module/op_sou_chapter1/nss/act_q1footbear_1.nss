//Kill the bear
void main()
{
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), OBJECT_SELF);
    AdjustAlignment(GetPCSpeaker(), ALIGNMENT_EVIL, 2);
}
