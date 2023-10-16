int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"q2adurnantalk")==10;
    return iResult;
}
