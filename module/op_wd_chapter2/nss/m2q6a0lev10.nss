int StartingConditional()
{
    int iLevel = GetHitDice(GetPCSpeaker());
    if (iLevel < 10)
    {
        return TRUE;
    }
    return FALSE;
}
