int StartingConditional()
{
    int iRoll = d100();
    if (iRoll < 8)
    {
        return TRUE;
    }
    return FALSE;
}
