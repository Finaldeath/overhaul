int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"PC_Aribeth_Meter");
    if (iPlot < 2)
    {
        return TRUE;
    }
    return FALSE;
}
