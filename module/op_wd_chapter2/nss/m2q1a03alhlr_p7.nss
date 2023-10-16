int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_ALHELOR_PLOT") >= 10;
    return iResult;
}
