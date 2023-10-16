int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nRodColour") == 4)
        return TRUE;
    return FALSE;
}
