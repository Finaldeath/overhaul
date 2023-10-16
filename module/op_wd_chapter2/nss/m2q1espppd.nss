int StartingConditional()
{
    int iResult;

    iResult = (GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LFINDSPIRIT")== 80) || (GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LFINDSPIRIT")== 99);
    return iResult;
}
