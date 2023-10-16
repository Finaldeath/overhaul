int StartingConditional()
{
    if (GetGold(GetPCSpeaker()) < 400)
        return FALSE;

    return TRUE;
}
