int StartingConditional()
{
    if (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "q1bpipersword")) == TRUE)
        return TRUE;
    return FALSE;
}
