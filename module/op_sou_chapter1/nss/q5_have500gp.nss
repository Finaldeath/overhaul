// the PC has 500 gp

int StartingConditional()
{
    int iResult;

    iResult = GetGold(GetPCSpeaker()) > 499;
    return iResult;
}
