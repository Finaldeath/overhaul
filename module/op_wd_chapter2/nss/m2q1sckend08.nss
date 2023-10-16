int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"STIRGE_PLOT_DONE");
    if (iPlot == 0)
    {
        return TRUE;
    }
    return FALSE;
}

