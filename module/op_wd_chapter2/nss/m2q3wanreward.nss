#include "nw_i0_plot"

void main()
{
    RewardXP("m2q1_Wanev",100, GetPCSpeaker());
    CreateItemOnObject("nw_wdbmma003",GetPCSpeaker(),1);
    SetLocalInt(OBJECT_SELF,"NW_L_Leave",10);
}
