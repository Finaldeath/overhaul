#include "NW_I0_PLOT"

void main()
{
    RewardXP("xphigh", 100, GetPCSpeaker());
    SetLocalInt(OBJECT_SELF, "q5_Reward_Time", 1);
}
