int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"X1_BECKADIED")==0;
    return iResult;
}
