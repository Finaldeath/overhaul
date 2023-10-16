// if the PC has not yet found either the hand, mask or tooth

int StartingConditional()
{
    int nPlot1 = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYq1_artifact_mask");
    int nPlot2 = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYq1_artifact_tooth");
    int nPlot3 = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYq1_artifact_hand");

    if ((nPlot1 < 20) || (nPlot2 < 20) || (nPlot3 < 20))
    {
        return TRUE;
    }
    return FALSE;
}
