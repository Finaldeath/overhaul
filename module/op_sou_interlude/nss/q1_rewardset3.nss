// advance the reward global by 2

void main()
{
    int nReward = GetLocalInt(OBJECT_SELF, "q1_Katriana_Reward");
    nReward += 2;
    SetLocalInt(OBJECT_SELF, "q1_Katriana_Reward", nReward);

    int nAmount = 500 + ((nReward - 1) * 100);

    SetCustomToken(1010, IntToString(nAmount));
}
