int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Met_Rhaine") == 3;
    return iResult;
}
