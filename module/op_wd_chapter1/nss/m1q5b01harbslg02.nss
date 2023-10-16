#include "NW_I0_Plot"
void main()
{
    RewardGP(200,GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_L_M1Q5BHarb_Reward",TRUE);
    CreateItemOnObject("NW_WSwmss002",GetPCSpeaker());
}
