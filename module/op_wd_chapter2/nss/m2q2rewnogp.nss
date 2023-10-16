#include "nw_i0_plot"

void main()
{
    RewardXP("m2q2_Main",75,GetPCSpeaker());
    AutoAlignG(DC_MEDIUM, GetPCSpeaker());
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"NW_MAARCL030"),GetPCSpeaker());
}
