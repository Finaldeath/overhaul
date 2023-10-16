#include "nw_i0_plot"

void main()
{
    CreateItemOnObject("nw_wspmsc002",GetPCSpeaker());
    //RewardGP(500,GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_L_GaveReward",10);
}
