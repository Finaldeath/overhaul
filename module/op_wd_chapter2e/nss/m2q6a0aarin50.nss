// this starting condition is true if Aribeth has already been told about
// the true location of the cult, Aarin already talked to

int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"Chapter2_Know_Cult");
    int iPlot2 = GetLocalInt(OBJECT_SELF,"Aarin_Told_Luskan");
    if ((iPlot == 1) && (iPlot2 != 0))
    {
        return TRUE;
    }
    return FALSE;
}
