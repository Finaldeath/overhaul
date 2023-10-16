///Check if Valen journal has not given the players
///Initial Journal entries on Mirror and Maker plots

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Valen_Journal")==0;
    return iResult;
}

