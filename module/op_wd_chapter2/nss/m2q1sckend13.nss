// XP reward for one ear plus 150 gp

#include "NW_I0_PLOT"

void main()
{
    RewardGP(350,GetPCSpeaker(),FALSE);
    RewardXP("m2q1_Bounty",25, GetPCSpeaker());
}
