int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LFINDSPIRIT") == 20;
    return iResult;
}
