int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_MIXED_BLOOD") == 0)
        return TRUE;

    return FALSE;
}
