int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_JOURNAL_ENTRYM3Q1_A07_BANDIT_PLOT") >= 10;
    return iResult;
}
