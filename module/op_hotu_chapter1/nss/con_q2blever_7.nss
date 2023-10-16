int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nRodColour") == 2)
        return TRUE;
    return FALSE;
}
