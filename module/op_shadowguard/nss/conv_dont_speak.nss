int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_DONT_SPEAK") == 1)
        return TRUE;

    return FALSE;
}
