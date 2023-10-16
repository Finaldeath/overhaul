int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetModule(),"Chapter2_Know_Cult") == 1;
    int iPlot2 = GetLocalInt(GetPCSpeaker(),"NW_JOURNAL_ENTRYm2q0_Main");
    if ((iPlot1 == 1) || (iPlot2 >= 45))
    {
        return TRUE;
    }
    return FALSE;
}
