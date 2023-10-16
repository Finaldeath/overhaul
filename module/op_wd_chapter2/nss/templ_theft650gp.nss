#include "nw_i0_plot"

void main()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(),"THEFT_ITEM01");
    ActionTakeItem(oItem,GetPCSpeaker());
    RewardGP(650,GetPCSpeaker(),FALSE);
    RewardXP("NW_THEFT_PLOT",100,GetPCSpeaker());
}
