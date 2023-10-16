//the plot is finished
//the speaker is not the PC who completed the plot

int StartingConditional()
{
    //if the cook quest has been completed.
    if (GetLocalInt(GetPCSpeaker(),"NW_JOURNAL_ENTRYq1dcook") > 10)
    {
        //if the PC was the one who did the quest
        if (GetLocalInt(GetPCSpeaker(), "Lodar_Job") == 0)
        {
            return TRUE;
        }
        return FALSE;
    }
    return FALSE;
}
