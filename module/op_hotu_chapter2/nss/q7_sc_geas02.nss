// if the Valsharess has said she will remove the geas

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q7_Geas_Removed") == 1;
    return iResult;
}
