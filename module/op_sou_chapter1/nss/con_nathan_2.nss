int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"X1_BECKADIED")==10;
    return iResult;
}
