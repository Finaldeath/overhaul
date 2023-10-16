// the PC has spoken to Daschnaya

int StartingConditional()
{
    //int nTalk = GetLocalInt(GetPCSpeaker(), "q1i_talked_Katriana");
    int nPlot = GetLocalInt(GetPCSpeaker(), "q1i_Katriana_Job");
    if (nPlot == 3)
    {
        return TRUE;
    }
    return FALSE;
}
