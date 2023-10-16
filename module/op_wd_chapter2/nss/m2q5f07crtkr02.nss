int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Asked_Brotherhood") == 1;
    return iResult;
}
