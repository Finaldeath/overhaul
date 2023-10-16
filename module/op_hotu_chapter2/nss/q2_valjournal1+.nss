///Check if Valen journal given the players or
/// if Cavallas has been spoken to

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Valen_Journal")>=1;
    return iResult;
}


