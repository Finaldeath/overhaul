// when Shaldrissa has been rescued

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_KENDRACK_PLOT") == 3;
    return iResult;
}
