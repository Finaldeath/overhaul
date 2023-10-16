int StartingConditional()
{
    if (GetGold(GetPCSpeaker()) < 300)
        return FALSE;

    return TRUE;
}
