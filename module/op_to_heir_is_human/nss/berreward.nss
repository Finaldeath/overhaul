#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetModule(),"Kill_Drow",99);
    RewardXP("Kill the Mistress",100,GetPCSpeaker());
}
