// if Ferran told the PC about a kobold leaving the crypt

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q2_Heard_Deekin") == 1;
    return iResult;
}
