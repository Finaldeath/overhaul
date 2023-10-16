void main()
{
    object o = GetFirstObjectInArea();

    while (o != OBJECT_INVALID)
    {
        SetTrapDisabled(o);

        SetLocked(o, FALSE);

        o = GetNextObjectInArea();
    }

    SetLocalInt(OBJECT_SELF, "N_TRAP_DISABLED", 1);
}
