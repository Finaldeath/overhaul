// Kendrack's bounty job has not been accepted

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_KENDRACK_PLOT") == 0;
    return iResult;
}
