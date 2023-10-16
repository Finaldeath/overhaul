int StartingConditional()
{
    int iRoll = d100();
    if (iRoll < 26)
    {
        return TRUE;
    }
    return FALSE;
}
