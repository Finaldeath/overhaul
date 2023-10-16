// if the PC has already spoken to Katriana
// but she did not mention the cards

int StartingConditional()
{
    int nTalk = GetLocalInt(GetPCSpeaker(), "q1i_talked_Katriana");
    int nPlot = GetLocalInt(GetPCSpeaker(), "q1i_Katriana_Job");
    if ((nTalk == 1) && (nPlot == 0))
    {
        return TRUE;
    }
    return FALSE;
}
