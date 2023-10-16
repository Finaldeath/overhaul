int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nTalkOnce") == 0)
        return TRUE;
    return FALSE;
}
