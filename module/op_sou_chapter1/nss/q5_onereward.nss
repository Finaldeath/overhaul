// Tymofarrar has given out one reward

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Rewards_Given") < 2;
    return iResult;
}
