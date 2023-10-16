int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_L_M2Q1A02NEURIK_PLOT") >= 60;
    return iResult;
}

