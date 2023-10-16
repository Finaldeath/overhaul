int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "N_KEPT_SOUL_BROOCH") == 1)
        return TRUE;

    return FALSE;
}
