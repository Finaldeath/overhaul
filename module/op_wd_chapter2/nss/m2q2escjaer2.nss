int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LJAERTALK") == 1;
    return iResult;

}
