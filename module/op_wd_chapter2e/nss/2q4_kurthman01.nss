int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"Kurth_Job");
    int iRoll = d100();
    if ((iRoll < 26) && (iPlot > 0))
    {
        return TRUE;
    }
    return FALSE;
}
