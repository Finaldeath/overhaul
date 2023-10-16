int StartingConditional()
{
    if (GetGold(GetPCSpeaker()) < 10)
        return FALSE;

    return TRUE;
}
