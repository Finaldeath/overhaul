void main()
{
    object o = GetFirstObjectInArea();

    while (o != OBJECT_INVALID)
    {
        if (GetTag(o) == "PLAC_CONT_STONE_PED")
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(50), o);

        o = GetNextObjectInArea();
    }
}
