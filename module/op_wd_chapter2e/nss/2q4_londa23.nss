// once the plot is over and Londa is leaving

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Londa_Plot") >= 40;
    return iResult;
}
