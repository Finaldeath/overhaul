int StartingConditional()
{
    string s = "CT_STAT_NT_GARI";

    if (GetTag(OBJECT_SELF) == s)
        return TRUE;

    return FALSE;
}
