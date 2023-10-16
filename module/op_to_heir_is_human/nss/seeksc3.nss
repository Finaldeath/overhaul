int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Heir_Plot")==20||
              GetLocalInt(GetModule(),"Heir_Plot")==80;
    return iResult;
}

