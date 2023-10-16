// Tymofarrar has already agreed to defend Hilltop

#include "NW_I0_PLOT"

void main()
{
    int nReward = GetLocalInt(OBJECT_SELF, "q5_Rewards_Given");

    RewardXP("xplow", 100, GetPCSpeaker(), ALIGNMENT_GOOD);
    AdjustAlignment(GetPCSpeaker(), ALIGNMENT_GOOD, 5);
    SetLocalInt(OBJECT_SELF, "q5_Gave_Hilltop", 2);
    SetLocalInt(OBJECT_SELF, "q5_Rewards_Given", (nReward + 1));
}
