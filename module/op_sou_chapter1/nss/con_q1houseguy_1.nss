int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nKickedOutOfHome") == 1)
        return TRUE;
    return FALSE;
}
