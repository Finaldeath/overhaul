int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_TRAP_DISABLED") == 1)
        return TRUE;

    return FALSE;
}
