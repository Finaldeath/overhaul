int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"Baram_Job");
    int iRoll = d100();
    if ((iRoll < 26) && (iPlot > 0))
    {
        return TRUE;
    }
    return FALSE;
}
