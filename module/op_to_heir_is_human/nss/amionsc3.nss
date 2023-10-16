int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Heir_Plot")==20&&
              GetLocalInt(GetModule(),"Gate_Open")==99;
    return iResult;
}
