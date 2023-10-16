#include "nw_i0_plot"

void main()
{
    RewardGP(300,GetPCSpeaker(),FALSE);
    RewardXP("m1q3_Samuel",100,GetPCSpeaker(),ALIGNMENT_GOOD);
    SetLocalInt(GetModule(),"NW_Thurin_Plot",200);
}
