// the line has a 25% chance of being spoken

int StartingConditional()
{
    int iResult;

    iResult = d100() < 26;
    return iResult;
}
