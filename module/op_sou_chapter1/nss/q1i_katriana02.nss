// if the PC has already spoken to Katriana
// and she has mentioned the cards
// but the cards have not been returned

int StartingConditional()
{
    int nTalk = GetLocalInt(GetPCSpeaker(), "q1i_talked_Katriana");
    int nPlot = GetLocalInt(GetPCSpeaker(), "q1i_Katriana_Job");
    if ((nTalk == 1) && (nPlot == 1))
    {
        return TRUE;
    }
    return FALSE;
}
