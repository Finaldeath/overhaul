int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_EltooraThreat") == 0;
    return iResult;
}
