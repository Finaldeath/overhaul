void main()
{
    effect e = GetFirstEffect(OBJECT_SELF);

    while (GetIsEffectValid(e) == TRUE)
    {
        if (GetEffectType(e) == EFFECT_TYPE_VISUALEFFECT)
        {
            RemoveEffect(OBJECT_SELF, e);
        }

        e = GetNextEffect(OBJECT_SELF);
    }
}
