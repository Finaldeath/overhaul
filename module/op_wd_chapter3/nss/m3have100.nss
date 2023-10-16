// * player has at least 300 gp.
int StartingConditional()
{
    int iResult;

    iResult = GetGold(GetPCSpeaker()) >= 100;
    return iResult;
}
