#include "nw_i0_plot"

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_Reward",10);
    RewardGP(900, GetPCSpeaker());
    RewardXP("m2q5_Mutamin",100,GetPCSpeaker());
    CreateItemOnObject("NW_MAARCL017",GetPCSpeaker(),1);
}
