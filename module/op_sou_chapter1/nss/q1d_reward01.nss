// if Lodar has not yet mentioned a reward
// and Mara survived

int StartingConditional()
{
    int nReward = GetLocalInt(OBJECT_SELF, "q1d_Lodar_Reward");
    int nAlive = GetLocalInt(GetModule(), "Captive_Cook");

    if ((nReward == 0) && (nAlive == 3))
    {
        return TRUE;
    }
    return FALSE;
}
