int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"nLeftYP") != 1)
        return FALSE;

    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"q2adurnantalk")==20;

    return iResult;
}
