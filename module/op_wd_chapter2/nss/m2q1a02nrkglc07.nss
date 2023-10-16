int StartingConditional()
{
    int iResult;
    iResult = GetLocalInt(GetPCSpeaker(), "NW_L_M2Q1A02NEURIK_PLOT") == 70;
    return iResult;
}
