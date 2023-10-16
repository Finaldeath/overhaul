// this global should be set once the Host Tower area has been entered
// at the same time, Aribeth should be removed from Port Llast

int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"Chapter2_Aribeth_Falls");
    if (iPlot == 1)
    {
        return TRUE;
    }
    return FALSE;
}
