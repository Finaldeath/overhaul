// the PC has spoken to Deekin

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q6_Deekin_Job") > 0;
    return iResult;
}
