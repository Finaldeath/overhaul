int StartingConditional()
{
    int iRoll = d100();
    if (iRoll < 16)
    {
        return TRUE;
    }
    return FALSE;
}
