int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nRodColour") == 3)
        return TRUE;
    return FALSE;
}
