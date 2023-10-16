int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYq1bhalfling") == 0)
        return TRUE;
    return FALSE;
}
