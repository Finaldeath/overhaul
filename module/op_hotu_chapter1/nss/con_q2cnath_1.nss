int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nWaitForPCToReturn") == 1)
        return TRUE;
    return FALSE;
}
