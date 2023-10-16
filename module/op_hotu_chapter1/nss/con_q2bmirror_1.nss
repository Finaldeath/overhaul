int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return FALSE;
    return TRUE;
}
