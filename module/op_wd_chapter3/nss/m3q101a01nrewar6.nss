/////Threaten reward given and mark PC as hated by Neurik


#include "nw_i0_plot"

void main()
{
    RewardGP(100, GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(),"NEURIK_HATE",1);
}


