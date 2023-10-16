int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Chapter2_Know_Cult") == 0 &&
              GetLocalInt(GetPCSpeaker(),"NW_L_M2Q1BARAXANGRY") == 0;
    return iResult;
}
