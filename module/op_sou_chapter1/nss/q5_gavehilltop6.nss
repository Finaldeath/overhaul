// The PC is upping the ante

void main()
{
    int nReward = GetLocalInt(OBJECT_SELF, "q5_Rewards_Given");
    SetLocalInt(OBJECT_SELF, "q5_Rewards_Given", (nReward - 1));
}
