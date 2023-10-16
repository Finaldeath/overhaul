int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"DrankWine")==10;
    return iResult;
}
