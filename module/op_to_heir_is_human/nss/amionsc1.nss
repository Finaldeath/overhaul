int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Heir_Plot")==0||
              GetLocalInt(GetModule(),"Heir_Plot")==10;
    return iResult;
}


