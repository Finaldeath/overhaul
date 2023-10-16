// Tymofarrar frees Deekin

void main()
{
    int nReward = GetLocalInt(OBJECT_SELF, "q5_Rewards_Given");

    SetLocalInt(GetModule(), "q5_Deekin_Free", 1);
    SetLocalInt(OBJECT_SELF, "q5_Rewards_Given", (nReward + 1));
    CreateItemOnObject("q5_Deekin_Shoe", GetPCSpeaker());
}
