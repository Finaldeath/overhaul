int StartingConditional()
{
    if (GetGold(GetPCSpeaker()) < 75)
        return FALSE;

    return TRUE;
}
