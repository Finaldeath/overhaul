#include "nw_i0_plot"

void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_G_M3Q1TRIAL_XP")==0)
    {
        RewardGP(2000, GetPCSpeaker());
        RewardXP("M3Q1_TRIAL_PLOT",100,GetPCSpeaker(),ALIGNMENT_GOOD);
        SetLocalInt(OBJECT_SELF,"NW_G_M3Q1TRIAL_XP",1);
    }
}



