//con_q1doldman_1
int StartingConditional()
{
    //if the cook quest has not been completed.
    if (GetLocalInt(GetPCSpeaker(),"NW_JOURNAL_ENTRYq1dcook") <= 10)
        return TRUE;
    return FALSE;
}
