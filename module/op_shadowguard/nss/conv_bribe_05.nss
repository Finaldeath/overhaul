int StartingConditional()
{
    if (GetGold(GetPCSpeaker()) < 5)
        return FALSE;

    return TRUE;
}
