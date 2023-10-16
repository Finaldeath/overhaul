int StartingConditional()
{
    if (GetGold(GetPCSpeaker()) < 200)
        return FALSE;

    return TRUE;
}
