// and the cards have been returned
// but the PC has not spoken to Daschnaya

int StartingConditional()
{
   // int nTalk = GetLocalInt(GetPCSpeaker(), "q1i_talked_Katriana");
    int nPlot = GetLocalInt(GetPCSpeaker(), "q1i_Katriana_Job");
    if (nPlot == 2)
    {
        return TRUE;
    }
    return FALSE;
}
