int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"X1_NATHANSPEAK")<20;
    return iResult;
}
