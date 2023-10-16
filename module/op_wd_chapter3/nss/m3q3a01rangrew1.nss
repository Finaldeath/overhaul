//////Give PC gold and set status to hate PC
////////

#include "nw_i0_plot"

void main()
{
    RewardGP(50,GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(),"Devlar_Hate",1);
}

