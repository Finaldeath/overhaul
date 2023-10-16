int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LKILLED")==0 &&
              GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LWIN")==TRUE;
    return iResult;
}
