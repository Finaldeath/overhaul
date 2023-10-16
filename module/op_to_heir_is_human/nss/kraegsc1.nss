int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Kraegen_Talk")==0;
    return iResult;
}
