///////// Set character to follow player and attack any hostiles in sight

#include "nw_i0_plot"

void main()
{
    // * no need to set anything -- his heart beat script makes him move
    SetLocalInt(OBJECT_SELF,"NW_G_M4Q01_RALLY",1);
    SetLocalObject(OBJECT_SELF,"NW_G_M4Q01_RALLY",GetPCSpeaker());
    RewardXP("NW_XP_ONLY",100,GetPCSpeaker());
}
