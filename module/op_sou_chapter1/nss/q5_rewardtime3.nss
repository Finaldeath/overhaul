// if Tymofarrar and the PC are basically done

int StartingConditional()
{
    int nPlot = GetLocalInt(OBJECT_SELF, "q5_Reward_Time");
    int nReward = GetLocalInt(OBJECT_SELF, "q5_Rewards_Given");

    if ((nPlot == 1) && (nReward > 1))
    {
        return TRUE;
    }
    return FALSE;
}
