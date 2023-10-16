// check if the PC has 100 gold

int StartingConditional()
{
    int iResult;

    iResult = GetGold(GetPCSpeaker()) > 99;
    return iResult;
}
