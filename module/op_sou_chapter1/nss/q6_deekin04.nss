// if Deekin has told the PC what he wants

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q6_Deekin_Job") == 1;
    return iResult;
}
