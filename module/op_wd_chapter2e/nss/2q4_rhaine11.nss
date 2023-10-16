int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Met_Rhaine") == 2;
    return iResult;
}
