int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Akula_Talk") ==1;
    return iResult;
}
