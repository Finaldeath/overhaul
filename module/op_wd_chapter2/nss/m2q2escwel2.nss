int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LWELCARBEAT") == TRUE;
    return iResult;
}
