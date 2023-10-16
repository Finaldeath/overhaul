int StartingConditional()
{
    if (GetGold(GetPCSpeaker()) < 500)
        return FALSE;

    return TRUE;
}
