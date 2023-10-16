int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Kill_Drow")==0;
    return iResult;
}
