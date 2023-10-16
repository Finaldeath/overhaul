int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"AkulaPlotDone") ==0;
    return iResult;
}
