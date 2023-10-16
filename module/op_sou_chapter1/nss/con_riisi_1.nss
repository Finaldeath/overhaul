int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nFetchingItems") == 1)
        return TRUE;
    return FALSE;
}
