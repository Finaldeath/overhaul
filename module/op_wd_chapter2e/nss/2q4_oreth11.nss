int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Met_Oreth") == 2;
    return iResult;
}
