int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"Chapter2_Know_Cult");
    if (iPlot == 1)
    {
        return TRUE;
    }
    return FALSE;
}
