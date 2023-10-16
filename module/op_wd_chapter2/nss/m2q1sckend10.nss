int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"DELILAH_PLOT_DONE");
    if (iPlot == 0)
    {
        return TRUE;
    }
    return FALSE;
}

