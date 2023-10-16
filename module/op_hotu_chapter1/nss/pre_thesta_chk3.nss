// checks to see that the PC has 500 gp
// and that the PC is of normal intelligence



int StartingConditional()
{
    int iResult;

    iResult = ((GetGold(GetPCSpeaker()) > 499));
    return iResult;
}
