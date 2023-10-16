int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_CONST_ACTIVATED") == 1)
        return TRUE;

    return FALSE;
}
