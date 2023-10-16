int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Kraegen_Talk")==10&&
              GetLocalInt(GetModule(),"Heir_Plot")==99;
    return iResult;
}



