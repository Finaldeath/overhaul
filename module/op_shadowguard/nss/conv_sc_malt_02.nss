int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "N_DRANK_PH_ALE") == 1)
        return TRUE;

    return FALSE;
}
