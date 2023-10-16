int StartingConditional()
{
    string sTag = "M3Q3B_GONG_1";
    if (GetTag(OBJECT_SELF) == sTag)
    {
        return TRUE;
    }
    return FALSE;
}
