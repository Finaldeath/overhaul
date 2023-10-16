int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LELGARTALK") == 1;
    return iResult;
}
