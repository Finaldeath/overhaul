//Checks if player has at least 1 gold piece

int StartingConditional()
{
    int iResult;

    iResult = GetGold(GetPCSpeaker())>=1;
    return iResult;
}
