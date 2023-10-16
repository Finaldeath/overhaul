// mark the plot as done, give extra xp reward

#include "NW_I0_PLOT"

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_KENDRACK_PLOT",6);
    SetLocalInt(GetModule(), "Ach_Kendrack_Bounty", 1);
    RewardXP("m2q1_Bounty",150, GetPCSpeaker());
}
