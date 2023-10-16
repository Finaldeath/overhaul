// advance the reward global by 1

void main()
{
    int nReward = GetLocalInt(OBJECT_SELF, "q1_Katriana_Reward");
    SetLocalInt(OBJECT_SELF, "q1_Katriana_Reward", (nReward + 1));
    int nAmount = 500 + (nReward * 100);

    SetCustomToken(1010, IntToString(nAmount));
}
