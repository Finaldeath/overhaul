int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_HENCH_SPEC_SPEAK") == 1)
        return TRUE;

    return FALSE;
}
