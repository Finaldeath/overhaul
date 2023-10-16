int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nFeedback") == 3)
        return TRUE;
    return FALSE;
}
