int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"q2asobreytalk")==20;
    return iResult;
}

