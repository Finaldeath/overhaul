#include "nw_i0_plot"
void main()
{
   SetLocalInt(GetModule(),"NW_G_M3Q04PLOTHEALED",99);
   CreateItemOnObject("NW_IT_GEM010", GetPCSpeaker());
   RewardXP("M3Q2_SMALL_REWARDS",100,GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_G_M3Q4A_HEALED",1);
}
