// turn the current reward amount into a token

void main()
{
    int nReward = GetLocalInt(OBJECT_SELF, "q1_Katriana_Reward");
    int nAmount = 500 + ((nReward - 1) * 100);

    SetCustomToken(1010, IntToString(nAmount));
}
