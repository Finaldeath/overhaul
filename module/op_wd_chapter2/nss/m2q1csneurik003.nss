int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_AskNeurikPortal") == 10;
    return iResult;
}
