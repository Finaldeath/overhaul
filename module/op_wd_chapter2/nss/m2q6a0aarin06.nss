int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"Chapter2_Talked_To_Aarin");
    if (iPlot == 0)
    {
        return TRUE;
    }
    return FALSE;
}
