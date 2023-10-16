// the PC has 300 gp

int StartingConditional()
{
    int iResult;

    iResult = GetGold(GetPCSpeaker()) > 299;
    return iResult;
}
