// if the Valsharess has not said she will remove the geas

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q7_Geas_Removed") == 0;
    return iResult;
}
