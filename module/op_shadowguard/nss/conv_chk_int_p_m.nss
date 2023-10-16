int StartingConditional()
{
    string sTag = GetTag(OBJECT_SELF);

    if (sTag == "PLAC_INT_MARK")
        return TRUE;

    return FALSE;
}
