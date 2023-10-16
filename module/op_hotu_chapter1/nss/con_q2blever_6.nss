int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nRodColour") == 1)
        return TRUE;

    return FALSE;
}
