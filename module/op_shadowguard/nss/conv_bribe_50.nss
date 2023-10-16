int StartingConditional()
{
    if (GetGold(GetPCSpeaker()) < 50)
        return FALSE;

    return TRUE;
}
