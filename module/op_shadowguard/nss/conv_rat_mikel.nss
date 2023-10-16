int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "N_RATTED_MIKE") == 1)
        return TRUE;

    return FALSE;
}
