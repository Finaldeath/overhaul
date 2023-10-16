#include "nw_i0_plot"
void main()
{

    if (GetLocalInt(OBJECT_SELF, "nRewardOnce") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nRewardOnce", 1);
        RewardXP("xplow",50,GetPCSpeaker());
        SetLocalInt(OBJECT_SELF, "nKoboldsReadyToFlee", 1);
    }
}
