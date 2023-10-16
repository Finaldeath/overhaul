int StartingConditional()
{
    if (GetGold(GetPCSpeaker()) < 20)
        return FALSE;

    return TRUE;
}
