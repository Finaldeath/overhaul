int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nRodColour") == 5)
        return TRUE;
    return FALSE;
}
