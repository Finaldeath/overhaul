#include "nw_i0_plot"
#include "NW_J_RESCUE"

void main()
{
    RewardGP(300, GetPCSpeaker());
    RewardXP("m2q2_Druids",20,GetPCSpeaker());
    SetLocalInt(GetModule(),"NW_M2Q2E_LFINDDRUID2",3);
}
