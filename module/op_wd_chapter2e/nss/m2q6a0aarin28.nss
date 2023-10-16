int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"Chapter2_Aribeth_Falls");
    if (iPlot > 0)
    {
        return TRUE;
    }
    return FALSE;
}
