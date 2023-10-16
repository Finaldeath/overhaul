int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"DamasTalk") == 0;
    return iResult;
}
