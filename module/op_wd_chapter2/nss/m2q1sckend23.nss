// Shaldrissa is dead, Kendreck not angry

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_KENDRACK_PLOT") == 5;
    return iResult;
}
