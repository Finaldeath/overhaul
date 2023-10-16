// if Deekin has not yet told the PC what he wants

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q6_Deekin_Job") == 0;
    return iResult;
}
