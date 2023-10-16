#include "nw_i0_plot"

void main()
{
    RewardGP(500, GetPCSpeaker());
    RewardXP("m2q2_Main",75,GetPCSpeaker());
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"nw_wspmsc006"),GetPCSpeaker());
}

