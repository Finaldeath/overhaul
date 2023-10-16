void main()
{
    object oPC = GetLastPlayerDying();

    object o = GetFirstFactionMember(oPC);

    int n = 0;

    while (o != oPC && o != OBJECT_INVALID)
    {
        if (GetArea(oPC) == GetArea(o))
        {
            n = 1;
        }

        o = GetNextFactionMember(oPC);
    }

    if (n != 1)
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oPC);
}
