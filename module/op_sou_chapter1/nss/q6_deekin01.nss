// check if Deekin was mentioned to the PC by the kobolds in the crypt

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q2_Deekin_Mentioned") == 1;
    return iResult;
}
