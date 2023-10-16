int StartingConditional()
{
    if (GetGold(GetPCSpeaker()) < 100)
        return FALSE;

    return TRUE;
}
