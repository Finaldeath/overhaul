int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nDroganHerbsTaken") == 1)
        return TRUE;
    return FALSE;
}
