int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nCured") != 1)
        return TRUE;
    return FALSE;
}
