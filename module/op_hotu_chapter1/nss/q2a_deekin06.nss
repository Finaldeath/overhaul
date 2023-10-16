// returns TRUE if Deekin is not actively liked by the PC

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q2a_Deekin_Like") < 5;
    return iResult;
}
