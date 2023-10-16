int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_CONST_ACTIVATED") == 0)
        return TRUE;

    return FALSE;
}
