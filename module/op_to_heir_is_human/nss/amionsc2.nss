int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Heir_Plot")==20&&
              GetLocalInt(GetModule(),"Gate_Open")==0;
    return iResult;
}
