int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Met_Oreth") == 1;
    return iResult;
}
