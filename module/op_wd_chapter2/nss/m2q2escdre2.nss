int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LDREGINTALK") == 1;
    return iResult;
}
