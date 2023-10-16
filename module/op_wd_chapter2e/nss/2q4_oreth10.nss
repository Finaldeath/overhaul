int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Met_Oreth") == 3;
    return iResult;
}
