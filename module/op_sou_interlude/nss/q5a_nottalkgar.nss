// the PC has already met Garrick

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"X1_GARRICKSPEAK") == 0;
    return iResult;
}
