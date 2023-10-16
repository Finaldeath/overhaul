// once Shaldrissa has been kidnapped

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_KENDRACK_PLOT") == 2;
    return iResult;
}
