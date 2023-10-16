int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"ZOR_PLOT_DONE");
    if (iPlot == 0)
    {
        return TRUE;
    }
    return FALSE;
}
