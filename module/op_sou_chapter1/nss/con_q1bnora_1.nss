int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYq1bfamily") == 0)
        return TRUE;
    return FALSE;
}
