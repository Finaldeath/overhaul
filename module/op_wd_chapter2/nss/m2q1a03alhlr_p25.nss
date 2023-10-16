#include "nw_i0_plot"

void main()
{
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(), "M2Q1ITRING01"), GetPCSpeaker());
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(), "M2Q1ITRING02"), GetPCSpeaker());
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(), "M2Q1ITRING03"), GetPCSpeaker());
    RewardGP(300, GetPCSpeaker());
    RewardXP("m2q1_Lycanthropy",20, GetPCSpeaker());
}
