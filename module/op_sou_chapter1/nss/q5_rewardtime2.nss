// if Tymofarrar has not given out all the rewards yet

int StartingConditional()
{
    int nPlot = GetLocalInt(OBJECT_SELF, "q5_Reward_Time");
    int nReward = GetLocalInt(OBJECT_SELF, "q5_Rewards_Given");

    if ((nPlot == 1) && (nReward < 2))
    {
        return TRUE;
    }
    return FALSE;
}
