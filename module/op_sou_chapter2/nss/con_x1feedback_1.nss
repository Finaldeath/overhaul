int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nFeedback") == 1)
        return TRUE;
    return FALSE;
}
