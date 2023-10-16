int StartingConditional()
{
    if (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "q1bcards")) == TRUE)
        return TRUE;
    return FALSE;
}
