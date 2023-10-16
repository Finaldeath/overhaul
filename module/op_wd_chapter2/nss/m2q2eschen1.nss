int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LHENNATALK") == 10;
    return iResult;
}
