// Shaldrissa is dead, Kendreck angry

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_KENDRACK_PLOT") == 4;
    return iResult;
}
