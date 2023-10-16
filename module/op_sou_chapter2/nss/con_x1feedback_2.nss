int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nFeedback") == 2)
        return TRUE;
    return FALSE;
}
