int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_PLAQUE_PLACED") == 0)
        return TRUE;

    return FALSE;
}
