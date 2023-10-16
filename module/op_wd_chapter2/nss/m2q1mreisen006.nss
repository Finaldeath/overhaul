#include "nw_i0_plot"

void main()
{
    RewardGP(300,GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_L_GaveReward",10);
}
