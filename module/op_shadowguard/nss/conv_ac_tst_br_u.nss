int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_LIT") == 0)
        return TRUE;

    return FALSE;
}
