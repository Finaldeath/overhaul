int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"q2asobreytalk")==10;
    return iResult;
}
