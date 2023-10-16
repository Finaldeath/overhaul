// post-plot, after Shaldrissa has been saved

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_KENDRACK_PLOT") == 6;
    return iResult;
}
