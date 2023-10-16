int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"BALLARD_TALK") == 1;
    return iResult;
}
