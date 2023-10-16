int StartingConditional()
{
    string s = "CT_STAT_NT_LAHK";

    if (GetTag(OBJECT_SELF) == s)
        return TRUE;

    return FALSE;
}
